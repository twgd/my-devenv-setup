# Development Guidelines

## Language

- Use English for source code, code comments, and commit messages.
- For conversation, workflow logs, and user-facing documents, follow the user's requested language or the active workflow's language setting.
- Workflow language settings do not override the English requirement for source code, code comments, and commit messages.

## Commits

- Use the Conventional Commits format for commit messages, such as `feat:`, `fix:`, `docs:`, or `chore:`.

## Source of Truth

- The canonical source for shared agent instructions is `dotfiles/.codex/AGENTS.md` in `my-devenv-setup`; edit that file only. `~/.codex/AGENTS.md` links to it.
- Verify Claude Code's instruction entry point before claiming it shares this file.

## Git Remotes and Transport

- Preserve the repository's existing remote names, URLs, and fetch/push transport. An SSH remote must continue to use SSH.
- Change remote configuration or transport only when the user explicitly authorizes that specific change. Authorization to develop, commit, push, verify CI, or repair a failing check does not authorize these changes.
- This boundary includes adding workaround remotes (such as `github-https`), changing fetch/push URLs, and applying `url.*.insteadOf` or `url.*.pushInsteadOf` rewrites. It applies to persistent configuration at any scope and temporary overrides through `git -c`, environment variables, scripts, or hooks.
- If authentication or remote verification fails, diagnose with read-only checks using the existing transport, report the failure and proposed remedy, and request authorization before any remote or transport change. Continue independent authorized work; leave checks that require the unavailable connection explicitly blocked.
- After an authorized change, verify both stored configuration and effective fetch/push URLs and transport, including applicable URL rewrites. Report any remaining overrides; an unchanged stored `origin.url` alone does not prove that transport is unchanged.

## Important Reminders

**NEVER**:

- Bypass linting or type checking to "make it work"
- Commit code that doesn't compile or breaks existing tests
- Disable tests instead of fixing them
- Act on unresolved material ambiguity about user intent, scope, or authorization

**ALWAYS**:

- Check for existing similar implementations before writing new code
- Check available context to resolve ambiguity; if a material ambiguity remains, ask before dependent work. Continue independent work that is already authorized.
- In Git repositories, commit working changes in meaningful increments, following the active workflow's delivery rules.
- Update affected documentation when behavior, setup, usage, architecture, or workflow changes; use the checks under "After Every Task" to confirm what needs updating.
- Reassess after at most three failed attempts at the same approach, or earlier when required by the active workflow. Repeat a failed environment-dependent check only after a concrete correction is available.

## After Every Task

Before finishing, check if any of the following need updating:

- `AGENTS.md` — shared architecture, conventions, tool choices, or workflow changes
- `README.md` — setup steps, usage, or project overview changes

Only update if the task actually changed something relevant to those files.
