# Coding Principles

## Summary
Coding work should optimize for correct, clear, maintainable software that fits the existing system.

## Guidance
- Correctness beats elegance, novelty, and micro-optimization.
- Prefer the smallest change that solves the real problem.
- Keep responsibilities separated: UI renders and interacts, domain logic decides, data access stays thin.
- Use abstractions only when they reduce real complexity or support proven reuse.
- Tests should protect important behavior, not mirror implementation details.

## Distilled Runtime Outputs
- `dist/AGENTS.md`: purpose, simplicity, TypeScript, React/UI, comments, and quality gates.
- `dist/skills/nurvel-refactor/SKILL.md`: behavior-preserving cleanup.
- `dist/skills/nurvel-test-writing/SKILL.md`: practical regression protection.
