# /setup-project

You are running an interactive project setup wizard. Follow the steps below precisely.

---

## Step 1 — Detect Tech Stack

Read the following files if they exist: `package.json`, `tsconfig.json`, `next.config.*`, `vite.config.*`, `go.mod`, `Cargo.toml`, `requirements.txt`, `pyproject.toml`.

Also detect the active package manager by checking for lock files in this priority order:
1. `bun.lockb` → bun
2. `pnpm-lock.yaml` → pnpm
3. `yarn.lock` → yarn
4. `package-lock.json` → npm
5. No lock file → npm (default)

Also detect deployment target by checking for `vercel.json`, `.vercel/`, `railway.toml`, `Dockerfile`, etc.

Summarize detected stack in this format:

```
Detected stack:
  Runtime:        Node.js / Python / Go / Rust / ...
  Framework:      Next.js 15 / Express / FastAPI / ...
  Language:       TypeScript / JavaScript / Python / ...
  Package manager: bun / pnpm / yarn / npm
  Deployment:     Vercel / Railway / Docker / ...
```

Ask the user: "Is this correct? (yes / describe corrections)"

Wait for confirmation before proceeding. Store the confirmed package manager — all agents that install packages must use it.

---

## Step 2 — Audit Current Setup

Check each item below and determine its current status:

| # | Category | Item | Status |
|---|----------|------|--------|
| 1 | Audit | Tool call logging (`.claude/hooks/log-tools.sh`) | ✅ / ❌ |
| 2 | Code Quality | Linter (oxlint preferred; ESLint accepted) | ✅ / ⚠️ / ❌ |
| 3 | Code Quality | Formatter (oxfmt preferred; Prettier accepted) | ✅ / ⚠️ / ❌ |
| 4 | Code Quality | Type check (`tsc --noEmit` or equivalent) | ✅ / ❌ |
| 5 | Code Quality | Pre-commit hook (husky + lint-staged) | ✅ / ❌ |
| 6 | Testing | Unit test | ✅ / ❌ |
| 7 | Testing | E2E test | ✅ / ❌ |
| 8 | Observability | Error tracking (Sentry) | ✅ / ❌ |
| 9 | Observability | Logging | ✅ / ❌ |
| 10 | Analytics | Vercel Analytics (Vercel projects only) | ✅ / ❌ / N/A |
| 11 | Analytics | Google Analytics | ✅ / ❌ |
| 12 | Security | `.env.example` exists | ✅ / ❌ |
| 13 | Security | Secret scan (pre-commit) | ✅ / ❌ |
| 14 | CI/CD | GitHub Actions | ✅ / ❌ |
| 15 | Documentation | `README.md` structure | ✅ / ⚠️ / ❌ |
| 16 | Documentation | `CLAUDE.md` exists | ✅ / ❌ |

Status legend:
- ✅ Installed and meets standard
- ⚠️ Installed but needs attention (e.g. ESLint present → suggest migrating to oxlint)
- ❌ Not set up
- N/A Not applicable for this project (e.g. item 10 for non-Vercel projects)

For Code Quality tools, standards are:
- **Preferred**: oxlint + oxfmt (use `@nkzw/oxlint-config` as base config)
- **Accepted**: ESLint + Prettier (mark as ⚠️ and suggest migration)
- If neither exists: mark ❌

For Testing tools, suggest based on detected stack:
- Next.js / Vite → Vitest (unit), Playwright (E2E)
- Node.js API → Vitest or Node test runner
- Python → pytest
- Go → built-in `testing` package

---

## Step 3 — Selection

Display the audit table, then ask:

"Enter the numbers you want to set up or fix (comma-separated, e.g. 1,2,5,14). Enter `all` to select all ❌ items. Enter `all+` to also include ⚠️ items (note: this includes linter/formatter migrations which may require manual config updates). Enter `skip` to exit."

Wait for user input.

Before proceeding to Step 4, apply this rule to the selection:
- If item 13 is selected but item 5 is not, automatically add item 5 to the selection and inform the user: "Item 5 (pre-commit hook) has been added automatically — item 13 requires it."

---

## Step 4 — Concurrent Execution

Once the user confirms their selection, execute all selected items **in parallel using multiple agents simultaneously**, with the following dependency constraints:

**Ordering rules (enforce before dispatching):**
- Any of items 2, 3, and 4 that are selected must fully complete before item 5 is started (pre-commit hooks depend on linters/formatters being installed).
- Item 5 must fully complete before item 13 is started (secret scanning is added as a pre-commit hook).
- All other items are independent and can run in parallel.

**Execution strategy:**
1. Launch all selected items except 5 and 13 in parallel.
2. Once all selected items from {2, 3, 4} are done (skip this gate if none of 2/3/4 were selected), launch item 5.
3. Once item 5 is done, launch item 13.

Each agent should:
1. Handle exactly one setup item
2. Use the package manager detected in Step 1 for all install commands
3. Follow the official framework documentation or mainstream conventions
4. Check if partial setup exists before overwriting
5. Report back: item name, what was done, any manual steps required

### Item 1 — Tool call logging

Create `.claude/hooks/log-tools.sh` with the following content:

```bash
#!/usr/bin/env bash
# Logs Claude Code tool calls to .claude/tool-calls.log
# Hook type: PostToolUse — receives JSON on stdin with fields: tool_name, tool_input, etc.
LOGFILE="$(git rev-parse --show-toplevel 2>/dev/null || echo .)/.claude/tool-calls.log"
INPUT=$(cat)
if command -v jq &>/dev/null; then
  TOOL=$(echo "$INPUT" | jq -r '.tool_name // ""')
else
  TOOL=$(echo "$INPUT" | python3 -c "import sys,json; print(json.load(sys.stdin).get('tool_name',''))" 2>/dev/null)
fi
echo "[$(date -u +"%Y-%m-%dT%H:%M:%SZ")] tool=$TOOL input=$(echo "$INPUT" | head -c 200)" >> "$LOGFILE"
```

Make it executable (`chmod +x`). Then add or update `.claude/settings.json` to register it as a `PostToolUse` hook:

```json
{
  "hooks": {
    "PostToolUse": [
      { "command": ".claude/hooks/log-tools.sh" }
    ]
  }
}
```

If `.claude/settings.json` already exists, merge the hook entry rather than overwriting the file.

---

## Step 5 — Summary

After all agents complete, output a summary:

```
Setup complete.

✅ Done:
  - [item]: [brief description of what was done]

⚠️ Requires manual steps:
  - [item]: [what the user needs to do]

⏭️ Skipped:
  - [item]
```

If any item requires secrets, list them under "Requires manual steps" in recommended completion order:

1. **Before first deploy**: Sentry DSN → add `SENTRY_DSN` to `.env.local` and your hosting provider's environment variables.
2. **Before going live**: GA tracking ID → add `NEXT_PUBLIC_GA_ID` (or equivalent) to `.env.local`.
3. **Anytime**: other API keys or tokens — add to `.env.local` and mirror keys (without values) in `.env.example`.
