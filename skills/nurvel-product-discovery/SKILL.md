---
name: nurvel-product-discovery
description: Analyze what should be built and why before requirements; produce Idea Brief output as `idea-brief.md` when a workflow artifact is requested
triggers:
  - product discovery
  - idea brief
  - idea-brief.md
  - what should we build
  - should we build this
  - validate opportunity
  - evaluate feature idea
---

## When to use
- Evaluating a new idea, feature, or initiative
- Clarifying a loosely defined problem or opportunity
- Comparing multiple solution directions before scoping work
- Challenging output-first thinking before requirements or roadmap planning

## Discovery approach
- Frame the problem before the solution.
- Identify the affected users or stakeholders.
- Describe the current pain and the desired future state.
- Separate confirmed facts from assumptions and unknowns.
- Compare meaningful options, including doing nothing.
- Recommend a direction only after value, risk, and reversibility are visible.
- Call out what still needs validation before moving into requirements or roadmap work.

## OpenSpec compatibility
- If the repo contains `openspec/`, `openspec/specs/`, `openspec/changes/`, or `openspec/config.yaml`, treat the repo as OpenSpec-aware.
- In OpenSpec-aware repos, discovery is pre-spec work. Do not write or modify living specs until the direction is agreed.
- When a discovery outcome is ready to move forward, hand off a candidate change shape:
  - change intent
  - candidate change id
  - affected capability specs
  - what belongs in `proposal.md` vs later spec deltas
- Treat this skill as a pre-proposal exploration step: clarify the opportunity first, then prepare for a proposal.

## Workflow artifact output
When asked for an Idea Brief or workflow blueprint, produce `idea-brief.md` in this compact shape:

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

For non-blueprint discovery, keep the same substance in a concise chat answer: summary, problem, users, facts/assumptions/unknowns, options, recommendation, and what to validate next.

In OpenSpec-aware repos, append candidate `change-id`, affected `openspec/specs/<capability>/spec.md` files, and whether a new change should start only after the opportunity is clear.

## Check
- Is the real problem clear?
- Are users and business value explicit?
- Are assumptions visible?
- Were alternatives compared fairly?
- Is the recommendation justified?
- Is there anything critical still unvalidated?
- In OpenSpec-aware repos, is it clear whether this should update an existing change or start a new one?
