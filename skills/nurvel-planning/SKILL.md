---
name: nurvel-planning
description: Plan implementation approach; produce Technical Discovery as `technical-blueprint.md` and Implementation Handoff as `implementation-handoff.md`
triggers:
  - plan
  - technical discovery
  - technical-blueprint.md
  - implementation handoff
  - implementation-handoff.md
  - design approach
  - break down task
  - implementation strategy
  - architecture decision
mcp_servers:
  - context7  # documentation lookup when framework/library behavior affects the plan
---

## When to use
- Planning a new feature, fix, refactor, or investigation before implementation
- Defining implementation approach for non-trivial tasks
- Breaking down complex work into clear steps
- Aligning on scope and architecture before coding starts

## Planning approach
- Understand the real goal, not just the surface request.
- Treat the user request as a starting point, not a fully validated solution.
- Challenge assumptions when the proposed direction is flawed, inconsistent, risky, or overly complex.
- Analyze the relevant implementation area and surrounding constraints.
- Prefer the smallest correct plan over a broad redesign.
- Respect existing architecture unless there is a strong reason to change it.
- Do not introduce architectural refactors unless explicitly requested or clearly required.

## Analysis
- Identify whether the task is frontend-heavy, backend-heavy, integration-heavy, or hybrid.
- Inspect existing patterns before proposing new ones.
- Ground recommendations in the actual codebase, not generic best practices alone.
- Determine the correct implementation order when multiple parts are involved.
- Split work into phases only when it improves execution clarity.
- Use documentation lookup (e.g. `context7` MCP) when framework or library behavior materially affects the plan.

## Planning rules
- Keep plans high-signal and implementation-oriented.
- For `technical-blueprint.md`, avoid brittle implementation steps.
- For `implementation-handoff.md`, be concrete enough that another agent can execute without rediscovery.
- Reference layers, modules, domains, features, or directories by default; name files and contracts when needed for handoff accuracy.
- Avoid speculative design and unnecessary abstractions.
- Keep separation of concerns clear.
- Preserve client/server and domain/UI boundaries.
- Keep the plan implementable in small, reviewable changes.
- Avoid pushing accidental complexity downstream.

## Distinguish clearly between
- Must-do work
- Optional improvements
- Out-of-scope observations

## Workflow artifact outputs
When asked for Technical Discovery, produce `technical-blueprint.md`:

```md
# Technical Discovery

## Files inspected

## Current implementation

## Relevant patterns

## Existing utilities/components

## Constraints found

## Reuse opportunities

## Risks

## Recommended approach
```

When asked for Implementation Handoff, produce `implementation-handoff.md`. This is the first workflow artifact expected to contain ordered implementation steps:

```md
# Implementation Handoff

## Goal

## Non-Negotiables

## Scope
### Create
### Modify
### Inspect Only
### Out of Scope

## Current Facts

## Contracts

## Rules

## Implementation Steps

## Feature Rules

## Acceptance

## Test Plan

## Stop Conditions

## Handoff Instruction
```

For non-blueprint planning, keep the same substance in a concise chat answer: goal, implementation plan, guidance for implementer, and material open questions.

## Check
- Is the goal clear?
- Is the plan solving the right problem?
- Is the scope appropriate?
- Is the implementation order sensible?
- Are responsibilities and boundaries clear?
- Is there unnecessary complexity?
- Are key risks and assumptions visible?
