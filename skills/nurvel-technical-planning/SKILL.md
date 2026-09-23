---
name: nurvel-technical-planning
description: Plan technical implementation from existing code and agreed scope. Use for architecture decisions, technical discovery, ordered implementation plans, handoffs, and reports on completed implementation.
---

## Scope

- Establish the goal, constraints, and acceptance criteria before choosing an implementation. Flag unresolved product decisions that affect the plan.
- Plan only as much as the task needs. A planning-only request does not authorize implementation.

## Approach

1. Inspect the relevant implementation, contracts, dependencies, and existing patterns. Separate verified facts from assumptions.
2. Identify reusable components or utilities, affected layers, and compatibility constraints. Consult current documentation when library or framework behavior affects the decision.
3. Compare alternatives where the choice matters. Recommend the smallest approach that meets acceptance and preserves existing architecture unless a change is justified.
4. For implementation planning, order small, reviewable changes by dependency. Name files and contracts when they make the handoff actionable; avoid speculative file-by-file detail during discovery.
5. Define proportionate verification: important behavior, realistic edge cases, relevant unit or integration tests, type checks, and manual checks. Explain what each check establishes.
6. Separate required work, optional improvements, and out-of-scope observations. Expose unresolved risks and conditions that would require revisiting the plan.

## Output

- A concise plan should cover the goal, current facts, recommended approach, implementation order when requested, acceptance, verification, and material open questions.
- Technical discovery can end with an approach and unresolved decisions. A handoff should contain enough verified context for another implementer to proceed.
- Use existing project artifacts and conventions. Write or update files when requested; otherwise return the plan in chat.
- For named Technical Discovery, Implementation Handoff, or Implementation Report outputs without an existing template, read the relevant [artifact template](references/artifacts.md).
- Refresh facts when the branch, code, scope, or dependencies have changed since inspection.

## Check

- Is the approach grounded in the current implementation and within the requested scope?
- Are dependencies, contracts, acceptance, and verification clear?
- Can the next person distinguish decisions from assumptions without repeating the investigation?
