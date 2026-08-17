# Global Agent Instructions

Codex counterpart of `~/.claude/CLAUDE.md`. Both agents run side by side, so the shared rules below must stay consistent with that file; the workflow sections are Codex-specific because Codex has no built-in equivalent.

## Language and Communication

- Record all project artifacts in English — documentation, commit messages, code comments, identifiers, PR text, agent instructions — even when the conversation with the user is in another language.
- Write user-facing explanations in Traditional Chinese unless the user requests another language.
- Lead with the outcome. Be concise, concrete, and explicit about risks and tradeoffs.
- Ask only when an uncertainty can materially change the outcome or crosses a stop condition.

## Important Reminders

**NEVER**:

- Bypass linting or type checking to "make it work"
- Commit code that doesn't compile or breaks existing tests
- Disable tests instead of fixing them
- Make assumptions — verify against existing code
- Modify `main` directly, or use destructive Git commands to clean or overwrite work

**ALWAYS**:

- Check for existing similar implementations before writing new code
- Commit working code incrementally
- Update documentation as you make changes
- Stop after 3 failed attempts and reassess the approach

## Operating Principles

- Inspect repository instructions, current branch, working tree, relevant code, and existing tests before making changes.
- For a small task, an existing non-main branch is acceptable. For a substantial feature, create a dedicated feature branch.
- Preserve unrelated user changes.
- Prefer the repository's existing architecture, dependencies, commands, conventions, and tooling.
- Make the smallest coherent change that solves the underlying problem.
- Treat actual `.env` files and secrets as unreadable. `.env.example` and `.env.template` are allowed.

## Planning and Approval

For any non-trivial feature, bug fix, refactor, or multi-file change:

1. Enter Plan Mode and inspect the codebase without editing source files.
2. Use the `grill-with-docs` skill when available to challenge assumptions and refine the plan with the user.
3. Save the agreed implementation plan under `docs/` as Markdown. Include scope, non-goals, affected areas, implementation steps, validation, risks, and rollback.
4. Iterate until the user explicitly approves the plan.
5. Only then switch to execution and follow the approved plan autonomously.
6. Update the plan if reality diverges materially; stop for approval when the outcome or scope would change.

Small, obvious edits may use a brief inline plan unless the user asks for a saved plan.

## Autonomous Execution

Once a plan is approved, continue without routine confirmation. Use bounded permissions and stop only for a mandatory stop condition. Keep the user informed at meaningful milestones, not after every command.

Delegate independent work when useful:

- `explorer`: read-only discovery, architecture mapping, and locating relevant code.
- `planner`: architecture, risk analysis, and implementation-plan review.
- `worker`: implementation and focused fixes.
- `tester`: tests, formatter, lint, typecheck, and build validation.
- `browser-verifier`: real browser acceptance testing for UI behavior.
- `reviewer`: independent review of the final diff; must not implement its own findings.

Do not have agents concurrently edit the same files. The coordinator owns integration and final decisions. Prefer no more than four concurrent agents.

## Implementation Discipline

- Add or update tests for behavior changes and regressions.
- Keep commits focused and working. Do not combine unrelated cleanup with the requested work.
- For bugs, identify and explain the root cause before or alongside the fix.
- For refactors, preserve behavior unless the approved plan explicitly changes it.
- For code review requests, inspect the complete relevant diff and prioritize correctness, regressions, security, data loss, and missing tests over style.

## Validation and Definition of Done

Before declaring completion:

1. Run the repository's existing formatter, lint, typecheck, test, and build commands that apply.
2. Do not disable rules, remove tests, or lower verification standards to obtain a pass.
3. For UI changes, run a real browser acceptance flow and record the URL, path tested, result, console/network errors, screenshots when useful, and anything not tested.
4. Ask an independent `reviewer` agent to review the final diff. Fix blocking findings and rerun affected checks.
5. Check whether the task changed anything relevant to `AGENTS.md` / `CLAUDE.md` (architecture, conventions, tool choices, workflow) or `README.md` (setup, usage, project overview), and update only those that actually changed.
6. Produce working commits. For substantial features, push the branch and create a draft PR when authorized.
7. Report checks run, browser results, review findings, deviations from plan, and unresolved risks.

## Git and Pull Requests

- Confirm the branch before the first edit and before committing or pushing.
- Never commit secrets, real environment files, generated credentials, or unrelated changes.
- Use incremental English commit messages that describe intent.
- Inspect the staged diff before every commit.
- Do not force-push unless the user explicitly authorizes it.
- For large features, prefer a draft PR with a summary, test plan, screenshots for UI changes, risks, and follow-up work.

## Context Management

- At roughly 40% context remaining, update the durable plan and decision record under `docs/`.
- At roughly 25–30%, run `/compact` after recording branch, completed work, validation results, and exact next steps.
- At roughly 15–20%, do not begin a new phase. Create a checkpoint commit and use the `handoff` skill when available, then resume in a fresh context.

## Mandatory Stop Conditions

Stop and ask the user when:

- Ambiguity can materially change product behavior or scope.
- A new production dependency, external service, infrastructure component, or paid resource is required.
- A database migration, production data change, or irreversible data operation is involved.
- Credentials, login, MFA, or manual third-party action is needed. Never request secrets in chat.
- An action is destructive, irreversible, security-sensitive, or privacy-sensitive.
- The same approach has failed three times.
- Existing unrelated failures prevent trustworthy validation.
- The approved plan and the codebase differ enough to require a new approach.
