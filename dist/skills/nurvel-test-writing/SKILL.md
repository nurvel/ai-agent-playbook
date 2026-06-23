---
name: nurvel-test-writing
description: Add or improve tests; support the implementation handoff Test Plan section
triggers:
  - write test
  - add test
  - update test
  - test coverage
  - verify behavior
---

## When to use
- Adding or updating tests
- Deciding what is worth testing
- Improving confidence after refactor or bugfix

## Test priorities
- Test important behavior.
- Test critical logic and transformations.
- Test edge cases that are realistic and meaningful.
- Prefer testing behavior over implementation detail.

## Guidance
- Focus on what must not break.
- Prefer deterministic units.
- Test domain logic without unnecessary UI coupling.
- Avoid brittle tests tied to internal structure unless needed.
- Add tests where they increase confidence, not just coverage numbers.

## Workflow support role
- Support the `implementation-handoff.md` Test Plan section.
- Suggest the smallest useful unit, integration, typecheck, and manual checks for the handoff scope.
- Keep standalone test-writing output only when the user asks directly for tests or test strategy.

## Check
- Covers meaningful behavior; readable; not over-coupled to implementation; catches real regressions; tested at the simplest useful level.
