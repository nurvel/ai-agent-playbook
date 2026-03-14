## When to use
- Reviewing PRs
- Reviewing generated code
- Reviewing plans before implementation
- Reviewing refactors or feature work

## Review priorities
- Correctness first
- Then scope fit
- Then architecture and separation of concerns
- Then readability and maintainability
- Then API design and typing quality
- Then smaller polish issues
- Prefer finding the highest-impact issues first

## Plan review
When reviewing a plan, check:
- Is the goal clear?
- Is the plan solving the right problem?
- Is the scope appropriate?
- Is the implementation order sensible?
- Are responsibilities and boundaries clear?
- Is the plan over-specified or under-specified?
- Is there unnecessary complexity?
- Are key risks, assumptions, and constraints visible?
- Does it preserve existing architecture unless change is justified?

## Code review
When reviewing code, check:
- Does it solve the requested problem?
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
- Are important risks, blockers, or regressions addressed?

## Review principles
- Prefer concrete findings over vague criticism.
- Prefer actionable feedback over style commentary.
- Do not demand refactors unrelated to the requested task unless necessary for correctness.
- Do not confuse personal preference with a real problem.
- Avoid theoretical purity if the current solution is sound and maintainable.
- Keep feedback proportional to the task size.
- Do not approve weak work just because it is close enough.

## Distinguish clearly between
- Must-fix issues
- Should-improve issues
- Optional observations

## Output format
Prefer this structure unless asked otherwise:

1. **Verdict** — acceptable / acceptable with issues / not ready
2. **Must-fix** — only real blockers or meaningful issues
3. **Should improve** — worthwhile but non-blocking improvements
4. **Optional notes** — small observations, tradeoffs, or follow-up ideas
5. **Summary** — brief overall assessment

## Cross-reference
- Apply all defaults from `AGENTS.md`.