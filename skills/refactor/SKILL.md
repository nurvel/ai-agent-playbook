---
name: refactor
description: Restructure existing code without changing behavior
triggers:
  - refactor
  - restructure
  - clean up code
  - simplify code
  - reduce complexity
---

## When to use
- Existing code works but structure is weak
- Code is too large, unclear, duplicated, or mixed-responsibility
- Need better maintainability without changing behavior

## Refactor goals
- Preserve behavior unless change is explicitly requested.
- Reduce complexity.
- Improve readability.
- Clarify responsibilities.
- Make future changes easier.

## Refactor approach
- Start with the simplest structural improvement.
- Prefer small, reviewable steps.
- Extract only when extraction improves clarity.
- Reduce nesting and branching where possible.
- Remove dead code and obsolete wrappers.
- Keep data flow easy to follow.
- Avoid moving complexity to another file without actually reducing it.
- Avoid adding abstractions unless repeated patterns are stable and real.

## Check after refactor
- Behavior unchanged unless intended
- Clearer boundaries
- Smaller cognitive load
- No new indirection without payoff
- TypeScript and lint pass

## Cross-reference
- Apply all defaults from `AGENTS.md`.