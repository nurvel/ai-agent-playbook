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

## Check
- Does test cover meaningful behavior?
- Is test readable?
- Is test too coupled to implementation?
- Does it help catch regressions?
- Is there a simpler level to test this?

## Cross-reference
- Apply all defaults from `AGENTS.md`.