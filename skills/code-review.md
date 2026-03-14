## When to use
- Reviewing PRs
- Reviewing generated code
- Reviewing refactors or feature work

## Review priorities
- Correctness first
- Then architecture fit
- Then readability and maintainability
- Then API design
- Then typing quality
- Then smaller polish issues

## Check
- Does code solve the requested problem?
- Does it stay within scope?
- Does it respect layering and separation of concerns?
- Is business logic in the right place?
- Is abstraction justified?
- Is code easy to read quickly?
- Is TypeScript helping clarity?
- Are props / APIs too broad?
- Is there dead code or leftover complexity?
- Are comments actually needed and accurate?
- Are there lint or TypeScript issues?

## Output style
- Be concise.
- Call out high-signal issues first.
- Prefer concrete fixes over vague criticism.
- Separate must-fix from optional improvements.
- Say if code is over-engineered, under-structured, or in wrong layer.

## Cross-reference
- Apply all defaults from `AGENTS.md`.