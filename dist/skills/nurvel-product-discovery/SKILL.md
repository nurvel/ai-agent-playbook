---
name: nurvel-product-discovery
description: Analyze what should be built and why before defining detailed requirements or delivery plans
triggers:
  - product discovery
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

## Output format
Prefer this structure unless asked otherwise:

1. **Summary** — opportunity, key tradeoff, recommendation
2. **Problem statement** — what problem exists, for whom, why now
3. **Users and stakeholders** — primary and secondary groups affected
4. **Current pain and desired outcome** — present state, target state, success characteristics
5. **Facts, assumptions, unknowns** — what is known vs inferred
6. **Options considered** — including do nothing
7. **Recommendation** — direction and what to validate next

In OpenSpec-aware repos, append:

8. **OpenSpec handoff** — candidate `change-id`, affected `openspec/specs/<capability>/spec.md` files, and whether a new change should start or an existing one should be updated

## Check
- Is the real problem clear?
- Are users and business value explicit?
- Are assumptions visible?
- Were alternatives compared fairly?
- Is the recommendation justified?
- Is there anything critical still unvalidated?
- In OpenSpec-aware repos, is it clear whether this should update an existing change or start a new one?
