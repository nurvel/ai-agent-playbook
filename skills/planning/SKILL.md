---
name: planning
description: Plan implementation approach for non-trivial tasks before coding
triggers:
  - plan
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
- Do not over-specify implementation details.
- Reference layers, modules, domains, features, or directories rather than deep file-level micromanagement.
- Avoid speculative design and unnecessary abstractions.
- Keep separation of concerns clear.
- Preserve client/server and domain/UI boundaries.
- Keep the plan implementable in small, reviewable changes.
- Avoid pushing accidental complexity downstream.

## Distinguish clearly between
- Must-do work
- Optional improvements
- Out-of-scope observations

## Output format
Prefer this structure unless asked otherwise:

1. **Goal** — what needs to be achieved
2. **Implementation plan** — numbered, high-level steps with clear execution order
3. **Guidance for implementer** — constraints, key risks, important assumptions, what must be preserved
4. **Open questions** — only if materially needed

## Check
- Is the goal clear?
- Is the plan solving the right problem?
- Is the scope appropriate?
- Is the implementation order sensible?
- Are responsibilities and boundaries clear?
- Is there unnecessary complexity?
- Are key risks and assumptions visible?

## Cross-reference
- Apply all defaults from `AGENTS.md`.