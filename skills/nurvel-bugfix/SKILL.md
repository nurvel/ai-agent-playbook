---
name: nurvel-bugfix
description: Investigate incorrect behavior, diagnose regressions, and implement minimal fixes. Use for debugging runtime, logic, typing, or integration failures.
---

## Approach

1. Establish expected versus actual behavior and the conditions that trigger the failure. Reproduce it when practical; otherwise gather evidence and state the limitation.
2. Trace the failure through the relevant code, data, and contracts. Use available runtime or browser inspection tools when the failure needs that evidence.
3. Distinguish the cause from symptoms and untested hypotheses. Narrow uncertainty before making speculative changes.
4. When a fix is requested, make the smallest change that addresses the cause in the right layer. Preserve unrelated behavior and keep cleanup outside the fix unless required.
5. Recheck the original failure and relevant nearby behavior. Add or update a regression test when it meaningfully protects against recurrence; confirm that it would detect the original defect when feasible.

An investigation-only request ends with findings and a proposed fix. It does not authorize code changes.

## Verification

- Verify at the level where the failure occurred. A unit test may support the diagnosis without establishing browser or integration behavior.
- Prefer focused checks that exercise the failure over tests that merely mirror the implementation.
- If the cause or result remains unverified, say what evidence is missing and what would resolve it.

## Output

State the observed failure, cause or leading hypothesis, fix made or proposed, and verification results. Include material remaining risks without bundling unrelated improvements.
