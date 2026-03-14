---
name: bugfix
description: Fix incorrect behavior, debug regressions, investigate issues
triggers:
  - fix bug
  - debug
  - investigate issue
  - regression
  - broken behavior
mcp_servers:
  - chrome-devtools  # browser debugging and runtime inspection
---

## When to use
- Fixing incorrect behavior
- Debugging regressions
- Investigating runtime, logic, typing, or integration issues

## Bugfix approach
- Identify root cause before changing structure.
- Prefer minimal fix that addresses actual cause.
- Do not bundle unrelated cleanup into the same change unless necessary.
- Preserve existing behavior outside the bug scope.
- Add guardrails only when they solve a real failure mode.
- Avoid speculative fixes.

## Check
- What is broken?
- What is root cause?
- Is fix in the right layer?
- Is there a simpler fix?
- Does fix introduce side effects?
- Does fix require a test?
- Are lint and TypeScript clean?

## Output style
- State root cause clearly.
- State fix clearly.
- Mention risks or edge cases only if relevant.

## Cross-reference
- Apply all defaults from `AGENTS.md`.