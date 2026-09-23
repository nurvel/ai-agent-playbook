---
name: nurvel-requirements-definition
description: Turn a validated idea into scope and acceptance criteria; produce Requirement Refinement as `requirements-blueprint.md` or `product-spec.md`
triggers:
  - define requirements
  - requirement refinement
  - requirements blueprint
  - requirements-blueprint.md
  - product-spec.md
  - write spec
  - define spec
  - write proposal
  - spec delta
  - scope feature
  - acceptance criteria
  - product requirements
---

## When to use
- Turning a validated idea into implementation-ready scope
- Defining feature boundaries before design or engineering starts
- Reducing delivery risk through clearer requirements
- Writing acceptance criteria for design, engineering, or QA

## Requirements approach
- Restate the feature goal in plain language.
- Make users, outcomes, and scope boundaries explicit.
- Separate in-scope from out-of-scope items.
- Define functional requirements clearly and concretely.
- Add non-functional requirements only when relevant.
- Surface dependencies, assumptions, and risks early.
- Write acceptance criteria that are observable and testable.
- Keep strategy and execution detail separate. Do not add ordered implementation steps before `implementation-handoff.md`.

## OpenSpec compatibility
- If the repo contains `openspec/`, `openspec/specs/`, `openspec/changes/`, or `openspec/config.yaml`, prefer OpenSpec artifacts over generic product specs.
- In OpenSpec-aware repos:
  - put intent, scope, why now, and tradeoffs in `openspec/changes/<change-id>/proposal.md`
  - put behavioral requirements in `openspec/changes/<change-id>/specs/<capability>/spec.md`
  - use `design.md` only when technical decisions, architecture, or tradeoffs need explicit documentation
- Read existing `openspec/specs/<capability>/spec.md` files first. Proposed behavior should be expressed as deltas against current truth.
- Follow OpenSpec delta rules:
  - use `## ADDED Requirements`, `## MODIFIED Requirements`, `## REMOVED Requirements`, and `## RENAMED Requirements` as needed
  - use `### Requirement: <name>` headers
  - every requirement must include at least one `#### Scenario: <name>`
  - write requirement text with `SHALL` or `MUST`
- In repos with partial OpenSpec adoption, use OpenSpec for covered capabilities and plain chat or repo artifacts for the rest. Do not force a full migration as part of normal feature scoping.
- If the repo includes project-specific OpenSpec skills, follow their file-level workflow and use this skill for product framing, scope clarity, and delta quality.

## Workflow artifact outputs
When asked for Requirement Refinement, produce `requirements-blueprint.md`:

```md
# Requirement Refinement

## Current understanding

## Decisions needed

## Assumptions

## Edge cases

## Data rules

## UX rules

## Technical constraints

## Proposed scope
### In

### Out
```

When the work is ready for product-signoff or engineering input, produce `product-spec.md`:

```md
# User Story / Product Spec

## Title

## User Story

## Problem

## Desired Outcome

## Functional Requirements

## Acceptance Criteria

## Data / Content Rules

## UX Notes

## Non-Goals

## Technical Scope Summary

## Risks / Open Questions

## References
```

For non-blueprint requirements work, keep the same substance in a concise chat answer. Do not include implementation steps; keep execution planning separate.

In OpenSpec-aware repos, prefer this artifact mapping:
- `proposal.md` - summary, objective, scope, out of scope, dependencies, risks, open questions
- spec deltas - requirements and scenarios in `openspec/changes/<change-id>/specs/<capability>/spec.md`
- `design.md` - only if technical design needs to be preserved separately

## Check
- Is the scope unambiguous?
- Are boundaries explicit?
- Are requirements concrete?
- Are acceptance criteria testable?
- Are dependencies and risks visible?
- Is anything still too vague for implementation?
- In OpenSpec-aware repos, do requirement statements and scenarios match OpenSpec delta format?
