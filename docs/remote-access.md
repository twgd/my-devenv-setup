# Remote Access

Take over a terminal session running on the MacBook from a phone, over
Tailscale + SSH. The session lives in zellij on the Mac, so it survives
disconnects, sleep of the phone, and switching between devices.

This document covers the Tailscale + SSH + zellij setup specifically — one of
several ways to drive an agent on the Mac remotely. It is not tied to Claude
Code; any terminal program works the same way once you're attached. The other
two are Claude Code's built-in remote control, and Codex CLI reached from the
ChatGPT mobile app's own SSH client. See the main [README](../README.md) for
how the three compare.

Actual hostnames, IPs and key fingerprints are not recorded here — this repo is
public, and Termius already stores them in the saved host and identity.

## Recurring Workflow

### Before leaving the desk (Mac)

```bash
zj blog     # expands to: zellij attach --create blog
claude      # start Claude Code inside the session
```

Detach with `Ctrl+g` then `d`, or just close the terminal window. The session
keeps running in the background.

Two things must be true before walking away:

- **Power adapter connected.** On battery the machine sleeps after 3 minutes
  (`pmset` `sleep 3`), and a sleeping Mac is unreachable.
- **Lid open.** Closing the lid sleeps the machine even on AC, unless an
  external display is attached.

To override the sleep settings for one trip instead:

```bash
caffeinate -s -t 28800 &    # block system sleep for 8 hours
```

### Taking over from the phone

1. Open **Tailscale** and confirm it is connected.
2. Open **Termius** and connect to the saved MacBook host.
3. Reattach:

```bash
zj blog
```

The screen is exactly as it was left, still the same Claude Code process.

### Back at the desk

```bash
zj blog
```

Same command. The phone does not need to detach first — zellij allows several
clients attached to one session, and both see the same screen.

## Command Reference

| Command | Purpose |
| --- | --- |
| `zj [name]` | Attach, creating the session if absent (default `main`). Wraps `zellij attach --create`. Defined in `dotfiles/.zshrc`. |
| `zellij ls` | List sessions and their state |
| `zellij kill-session <name>` | Terminate a session for good |
| `Ctrl+g` | Toggle zellij's locked mode. While locked every key goes to the program inside; unlock to talk to zellij. |
| `Ctrl+g` then `d` | Detach, leaving the session running |
| `tailscale status` | Check which devices are online |
| `caffeinate -s -t 28800 &` | Block system sleep |

## Troubleshooting

Work down the list — each step rules out one layer:

```bash
tailscale status      # are both ends online?
ping <mac-magicdns-name>
zellij ls             # does the session still exist?
```

| Symptom | Cause | Fix |
| --- | --- | --- |
| Mac shows offline in Tailscale | It went to sleep | Power and lid, see above |
| Ping works, SSH refused | Key or file permissions | Permission checks below |
| Termius prompts for **password** | The key is not being used | Clear any stored password on the identity — a stored password takes priority over the key |
| Termius prompts for **passphrase** | Normal | This unlocks the private key, so key auth is working. Store it in the iOS keychain to stop the prompt. |
| Termius asks to enter a username | Host has no identity bound | Set the host's Credentials to the saved identity |
| `zellij ls` is empty | The Mac rebooted | Sessions do not survive a reboot; start again |

Permission checks, when key auth is rejected:

```bash
ls -ld ~ ~/.ssh                            # must be 755 and 700
ls -l ~/.ssh/authorized_keys               # must be 600
ssh-keygen -l -f ~/.ssh/authorized_keys    # compare the fingerprint
```

To prove server-side key auth works at all, independently of the phone:
generate a throwaway key, append it to `authorized_keys`, then

```bash
ssh -o PreferredAuthentications=publickey -o BatchMode=yes localhost 'echo ok'
```

and remove it again afterwards.

## One-Time Setup

Kept for reference when moving to a new machine.

1. **Tailscale** — enable *Run at login* from the menu bar icon.
2. **Remote Login** — System Settings → General → Sharing → Remote Login.
3. **Termius key** — generate an Ed25519 key in Keychain, labelled after the
   device that holds it (e.g. `iphone-termius`), not after what it is used for:
   when a device is lost, the label is how the right line in
   `authorized_keys` is found. Termius's own key-upload flow asks for a password
   login once and writes the public key to the Mac itself.
4. **Termius identity** — username, empty password, and the key. Leave the
   password blank; a stored password is always tried first and masks whether
   key auth is actually configured.
5. **zellij** — follow the official installation instructions:
   https://zellij.dev/documentation/installation

6. **Disable password login** — only once key auth is confirmed working, or
   both ways in are lost at the same time.

   ```bash
   printf 'PasswordAuthentication no\nChallengeResponseAuthentication no\nKbdInteractiveAuthentication no\n' \
     | sudo tee /etc/ssh/sshd_config.d/200-no-password.conf
   ```

   All three keywords are set because macOS keeps a keyboard-interactive
   fallback (via PAM) open unless the version-appropriate one is also
   disabled — setting all three covers it regardless of OpenSSH version.
   No service restart is needed; sshd is socket-activated and re-reads the
   config on every new connection.

   Verify — the effective config, not just the file:

   ```bash
   sudo sshd -T | grep -iE "passwordauthentication|kbdinteractive|challengeresponse"
   ssh -o PubkeyAuthentication=no -o BatchMode=yes localhost true
   ```

   All three must report `no`, and the second command must fail with
   `Permission denied (publickey)` — that list is what the server still
   accepts, so anything else appearing in it is still a way in.

7. **zellij config** — `dotfiles/.config/zellij/config.kdl`, linked into place by
   stow. The important setting is `default_mode "locked"`: zellij normally
   claims `Ctrl+p/n/t/o/s/h` as mode switches, which collide with the TUI
   running inside it. Locked mode passes every key through and leaves `Ctrl+g`
   as the single prefix — which also matters on a phone, where the on-screen
   `Ctrl` row is the only way to send those chords at all.
