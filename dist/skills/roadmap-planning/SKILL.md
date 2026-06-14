---
name: roadmap-planning
description: Sequence product initiatives into logical phases, milestones, and MVP cuts
triggers:
  - roadmap
  - plan milestones
  - sequence initiatives
  - release plan
  - quarter plan
---

## When to use
- Sequencing multiple features or initiatives
- Creating release, quarter, or milestone-based plans
- Mapping dependencies that affect delivery order
- Making MVP cut lines and later phases explicit

## Operating modes
- `chat-only`: return the roadmap as structured output in chat only.
- `repo-artifacts`: maintain roadmap artifacts in the repo.

## Artifact model
- Use `product/roadmap.md` as the strategic source of truth when working in `repo-artifacts` mode.
- Optionally link larger initiatives to `product/initiatives/<slug>.md`.
- If `product/roadmap.md` already exists, update it instead of creating parallel roadmap files.
- Do not create roadmap artifacts unless the user asks for repo-backed tracking or the repo already uses them.

## OpenSpec compatibility
- OpenSpec is a change-planning and living-spec system, not a roadmap system.
- Even in OpenSpec-heavy repos, keep roadmap state outside `openspec/specs/` and `openspec/changes/`.
- When OpenSpec is present, roadmap items should reference:
  - active change ids in `openspec/changes/<change-id>/`
  - affected capabilities in `openspec/specs/<capability>/spec.md`
- Only create or update an OpenSpec change when roadmap work is concrete enough to become an active planned change.
- Do not store milestones, release sequencing, or portfolio prioritization inside spec files.

## Roadmap approach
- Clarify the planning horizon before sequencing work.
- Group work into meaningful milestones or phases.
- Sequence by value, risk reduction, dependencies, or enablement, not by arbitrary order.
- Make milestone intent and exit criteria explicit.
- Keep roadmap planning strategic, not sprint-task level.
- Distinguish MVP work from later expansion.
- Surface critical path, assumptions, and tradeoffs clearly.
- Keep `Now`, `Next`, and `Later` distinct when no stronger planning horizon is provided.

## Output format
Prefer this structure unless asked otherwise:

1. **Roadmap summary** — proposed sequence and rationale
2. **Planning horizon** — release, quarter, half-year, or similar
3. **Strategic objective** — what the roadmap is trying to achieve
4. **Sequencing principles** — why work is ordered this way
5. **Milestones** — goal, scope, why now, dependencies, exit criteria
6. **Backlog or later phase** — items intentionally deferred
7. **Dependencies and risks** — critical path, assumptions, tradeoffs
8. **Recommendation** — roadmap, MVP cut line, key compromises

## Repo artifact expectations
When using `repo-artifacts`, prefer this structure in `product/roadmap.md`:

1. **Strategic objective**
2. **Planning horizon**
3. **Sequencing principles**
4. **Now**
5. **Next**
6. **Later**
7. **Milestones**
8. **Risks and dependencies**

In OpenSpec-aware repos, each roadmap item should also reference an OpenSpec capability or change id when available.

## Check
- Is the sequencing rationale explicit?
- Are dependencies visible?
- Is MVP distinct from later phases?
- Do milestones have a clear purpose?
- Is the roadmap realistic enough to guide decisions?
- Did this stay strategic rather than collapse into task detail?
- In OpenSpec-aware repos, did roadmap planning stay out of `openspec/specs/` and link to changes instead?
