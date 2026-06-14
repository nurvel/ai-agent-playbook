# B8: High-Level Workflow Layer

## Goal
Define a top-level engineering process where each phase produces a standard blueprint artifact that can be reused as input to the next phase, reducing repeated exploration, implementation ambiguity, review churn, and token usage.

The workflow must support work that happens over long time spans. Early artifacts should remain durable when implementation is months away, while detailed execution plans should only be produced when implementation is close enough for the details to stay valid.

## In Scope
- Define the phase model:
  - Idea Brief
  - Requirement Refinement
  - Technical Discovery
  - Implementation Handoff
  - Implementation Report
  - Post-Implementation Learning
- Define the expected blueprint output for each phase.
- Define the purpose, inputs, outputs, recommended skills, freshness rules, and acceptance checks for each phase.
- Decide whether the runtime package needs:
  - one high-level workflow guide
  - updates to existing skills
  - new phase-specific skills
  - some combination of those
- Preserve the seed blueprint templates in this requirement as input to the later design and implementation work.

## Out of Scope
- Implementing runtime `dist/` changes before the workflow design is accepted.
- Creating new runtime skills before skill naming, generic-vs-domain boundaries, and token budget rules are settled.
- Reintroducing OpenSpec artifacts for this repo.
- Requiring every target project to use every blueprint for every task.
- Producing granular implementation steps during early idea or requirement phases.

## Requirements
- The workflow layer must treat blueprints as phase output contracts, not as one universal template.
- Each blueprint must be concise enough for agents to load as task context without excessive token cost.
- Each phase must have a clear handoff boundary so later agents can continue without reconstructing prior reasoning.
- Early-phase blueprints must capture durable decisions, unknowns, and constraints while avoiding brittle implementation detail.
- Implementation Handoff must be the first phase expected to contain concrete execution steps.
- Implementation Report must make validation, deviations, and remaining risk explicit.
- Post-Implementation Learning must feed improvements back into principles, planning, skills, or future blueprint templates.
- The workflow must preserve these intended effects:
  - Idea briefs reduce premature analysis.
  - Product and requirement blueprints reduce ambiguity.
  - Technical blueprints reduce code exploration.
  - Handoff blueprints reduce implementation tokens.
  - Implementation reports and learning notes reduce review and correction loops.
- The design must map phases to existing skills where possible before proposing new skills.
- Runtime guidance must stay agent-agnostic and avoid embedding repo-only rationale.

## Candidate Phase Model

| Phase | Candidate output | Primary job | Candidate skills |
| --- | --- | --- | --- |
| Idea Brief | `idea-brief.md` | Capture the raw idea, problem, stakeholder, value, timing, constraints, and next refinement question. | `product-discovery` |
| Requirement Refinement | `requirements-blueprint.md` or `product-spec.md` | Convert the idea into scope, decisions, assumptions, rules, non-goals, and acceptance criteria. | `requirements-definition` |
| Technical Discovery | `technical-blueprint.md` | Inspect the real system shape, constraints, reusable patterns, risks, and recommended approach. | `planning`, `code-review` |
| Implementation Handoff | `implementation-handoff.md` | Provide an execution contract with scope, facts, contracts, steps, acceptance checks, tests, and stop conditions. | `planning`, `story-slicing`, `test-writing` |
| Implementation Report | `implementation-report.md` | Summarize changes, decisions, validation, deviations, risks, and follow-up work. | `code-review`, `backlog-management` |
| Post-Implementation Learning | `post-implementation-learning.md` | Capture what should improve in future requirements, discovery, handoff, skills, or blueprints. | future repo-local skill evolution workflow |

## Seed Blueprint Drafts

These starting templates are accepted as design input. They may be renamed, compressed, split, or merged during implementation if the resulting workflow stays clearer and more token-efficient.

### Idea Brief

```md
# Idea Brief

## Raw idea

## Problem

## User / stakeholder

## Why now

## Expected value

## Known constraints

## Unknowns

## Next refinement question
```

### Requirement Refinement

```md
# Requirement Refinement

## Current understanding

## Decisions needed
- ...

## Assumptions
- ...

## Edge cases
- ...

## Data rules
- ...

## UX rules
- ...

## Technical constraints
- ...

## Proposed scope
### In
- ...

### Out
- ...
```

### User Story / Product Spec

```md
# User Story / Product Spec

## Title
[Area] - [Change]

## User Story
As a [role]
I want [capability]
So that [outcome]

## Problem
- Current:
- Issue:
- Impact:

## Desired Outcome
- After change:
- User/system can:

## Functional Requirements
- Must:
- Must not:
- Existing behavior to preserve:

## Acceptance Criteria
- [ ] Given ..., when ..., then ...
- [ ] Given ..., when ..., then ...
- [ ] Regression: ...

## Data / Content Rules
- Include:
- Exclude:
- Format:
- Filename / labels / values:

## UX Notes
- Entry point:
- Empty state:
- Error/success behavior:

## Non-Goals
- ...

## Technical Scope Summary
- FE/BE/API:
- i18n:
- permissions:
- affected areas:

## Risks / Open Questions
- ...

## References
- ...
```

### Technical Discovery

```md
# Technical Discovery

## Files inspected
- ...

## Current implementation
- ...

## Relevant patterns
- ...

## Existing utilities/components
- ...

## Constraints found
- ...

## Reuse opportunities
- ...

## Risks
- ...

## Recommended approach
- ...
```

### Implementation Handoff

````md
# Implementation Handoff

## Goal
Implement [change] so that [technical/user outcome].

## Non-Negotiables
- Minimal diff.
- Preserve existing behavior unless explicitly changed.
- No unrelated refactors.
- Stop if plan conflicts with code.

## Scope
### Create
- path - reason

### Modify
- path - reason

### Inspect Only
- path - reason

### Out of Scope
- ...

## Current Facts
- Existing implementation:
- Existing patterns:
- Relevant constraints:

## Contracts
```ts
// types / data shapes / function signatures
```

## Rules
- null/undefined:
- formatting:
- edge cases:

## Implementation Steps
1. ...
2. ...
3. ...

## Feature Rules
- ...

## Acceptance
- [ ] ...
- [ ] ...

## Test Plan
- Unit:
- Typecheck:
- Manual:

## Stop Conditions
Stop and report if:
- ...

## Handoff Instruction
Implement exactly this plan. Keep diff minimal. Do not redesign. Run listed tests or explain why not possible.
````

### Implementation Report

```md
# Implementation Report

## Summary

## Files changed
- ...

## Key decisions
- ...

## Tests run
- ...

## Tests not run
- ...

## Deviations from plan
- ...

## Remaining risks
- ...
```

### Post-Implementation Learning

```md
# Post-Implementation Learning

## What worked

## What caused rework

## Missing requirement detail

## Missing technical detail

## Update needed to blueprint/skill
```

## Acceptance Criteria
- Each phase has a documented purpose, expected input, output artifact, recommended skill mapping, freshness rule, and acceptance check.
- The final workflow design explains which blueprint artifacts are optional, required, or only needed for larger work.
- The design explains where blueprint files should live in target projects without coupling the portable package to this repo's `planning/` layout.
- Early-phase templates exclude detailed implementation steps unless the work is ready for handoff.
- The handoff template can be used by an implementation agent without redoing product or technical discovery.
- The implementation report template can support review, follow-up planning, and future learning.
- Proposed runtime changes identify whether they affect `dist/AGENTS.md`, existing `dist/skills/**`, a new workflow artifact, or new skills.
- Runtime changes remain concise, agent-agnostic, and traceable to this requirement and workflow principles.
