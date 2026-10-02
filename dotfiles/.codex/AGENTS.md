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

## User Configuration and Authorization

- Preserve the user's existing settings at every scope: system, account, application, agent, development environment, and project. Adding, modifying, deleting, or overriding settings requires explicit user authorization for that specific change.
- When a task requires a configuration change outside the scope already explicitly authorized, first report why it is needed, the exact settings and scope affected, the proposed change, and its expected effects. Wait for the user's approval before executing the change. An explicit request to make a specific configuration change authorizes that change; it does not authorize unrelated adjustments.
- Authorization to develop, debug, commit, push, verify CI, or repair a failing check does not by itself authorize configuration changes. Tool or workflow defaults, authentication failures, and convenience do not supply authorization either.
- This boundary covers persistent settings and temporary overrides through command-line flags, environment variables, scripts, hooks, or alternate profiles. Reversibility or restoring the original settings afterward does not remove the approval requirement. Ordinary source-code edits within the authorized task remain permitted; a configuration change still requires authorization even when stored in source code.
- For Git, preserve existing remote names, fetch/push URLs, and transport. This includes adding workaround remotes such as `github-https`, switching SSH to HTTPS, and applying `url.*.insteadOf` or `url.*.pushInsteadOf` rewrites, including temporary `git -c` overrides.
- If existing settings prevent progress, diagnose with read-only checks, report the blocker and proposed remedy, and continue independent authorized work while awaiting approval. After an authorized change, verify both stored settings and effective behavior, and report the changes and any remaining overrides. An unchanged configuration file or stored `origin.url` alone does not prove that effective behavior is unchanged.

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
