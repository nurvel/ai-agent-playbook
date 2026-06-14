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
- Root cause identified, not just symptom?
- Fix in the right layer and minimal?
- Side effects considered; regression test added when needed?

## Output style
- State root cause clearly.
- State fix clearly.
- Mention risks or edge cases only if relevant.