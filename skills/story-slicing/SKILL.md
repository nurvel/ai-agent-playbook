---
name: story-slicing
description: Break defined work into small vertical slices with clear story boundaries and acceptance criteria
triggers:
  - slice stories
  - break down feature
  - user stories
  - split work
  - mvp slice
---

## When to use
- Breaking defined feature work into implementable stories
- Splitting oversized work into smaller reviewable slices
- Separating MVP flow from later enhancements or edge cases
- Preparing small, testable work items for engineering

## Story slicing approach
- Start from the user outcome, not the technical layers.
- Prefer vertical slices that deliver visible value.
- Separate must-have flow from enhancements, edge cases, and polish.
- Split oversized work by workflow step, happy path, permissions, validation, or edits when useful.
- Keep each story small enough to implement, review, and test.
- Make dependencies explicit.
- Mark MVP stories separately from later work.

## Output format
Prefer this structure unless asked otherwise:

1. **Feature summary** — user outcome and scope context
2. **Slicing strategy** — how the work is being partitioned and where the MVP cut sits
3. **Story list** — title, user story, scope, out of scope, acceptance criteria, dependencies, priority
4. **Dependency notes** — story ordering or coupling constraints
5. **Recommended implementation order** — practical sequence
6. **Risks** — sizing or ambiguity concerns

## Check
- Does each story deliver meaningful value?
- Are slices vertical where possible?
- Are stories small enough to implement safely?
- Is MVP explicit?
- Are acceptance criteria testable?
- Are dependencies visible?

## Cross-reference
- Apply all defaults from `AGENTS.md`.
