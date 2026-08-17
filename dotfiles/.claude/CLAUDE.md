# Development Guidelines

## Language
- Record all project artifacts in English — documentation, commit messages, code comments, etc. — even when the conversation with the user is in another language.

## Important Reminders

**NEVER**:
- Bypass linting or type checking to "make it work"
- Commit code that doesn't compile or breaks existing tests
- Disable tests instead of fixing them
- Make assumptions - verify with existing code

**ALWAYS**:
- Check for existing similar implementations before writing new code
- Commit working code incrementally
- Update documentation as you make changes
- Stop after 3 failed attempts and reassess the approach

## After Every Task
Before finishing, check if any of the following need updating:
- `CLAUDE.md` — architecture, conventions, tool choices, or workflow changes
- `README.md` — setup steps, usage, or project overview changes

Only update if the task actually changed something relevant to those files.
