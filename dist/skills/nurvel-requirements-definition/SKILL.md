---
name: nurvel-requirements-definition
description: Turn a validated product idea into clear scope, requirements, and acceptance criteria
triggers:
  - define requirements
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
- Keep strategy and execution detail separate.

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

## Output format
Prefer this structure unless asked otherwise:

1. **Feature summary** — what is being built and why
2. **Objective** — user and business outcome
3. **Users and stakeholders** — primary and secondary
4. **In scope** — explicit capabilities included
5. **Out of scope** — explicit boundaries
6. **Requirements** — functional and relevant non-functional requirements
7. **Dependencies, assumptions, risks** — key delivery constraints
8. **Acceptance criteria** — concrete and testable
9. **Open questions** — only real blockers or unresolved issues

In OpenSpec-aware repos, prefer this artifact mapping:

1. `proposal.md` — summary, objective, scope, out of scope, dependencies, risks, open questions
2. `spec delta` — requirements and scenarios in `openspec/changes/<change-id>/specs/<capability>/spec.md`
3. `design.md` — only if technical design needs to be preserved separately

## Check
- Is the scope unambiguous?
- Are boundaries explicit?
- Are requirements concrete?
- Are acceptance criteria testable?
- Are dependencies and risks visible?
- Is anything still too vague for implementation?
- In OpenSpec-aware repos, do requirement statements and scenarios match OpenSpec delta format?
