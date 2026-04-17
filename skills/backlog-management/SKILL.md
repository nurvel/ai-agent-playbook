---
name: backlog-management
description: Maintain backlog and roadmap state so priorities, progress, and next work stay current
triggers:
  - backlog
  - prioritize work
  - update roadmap
  - what next
  - reprioritize
---

## When to use
- Maintaining a current view of done, next, blocked, and later work
- Reprioritizing initiatives or feature candidates
- Updating roadmap state after decisions, delivery, or new information
- Preparing a concise status view for product or delivery planning

## Operating modes
- `chat-only`: return the backlog view in chat only.
- `repo-artifacts`: maintain backlog artifacts in the repo.

## Artifact model
- Use `product/backlog.md` as the operational source of truth when working in `repo-artifacts` mode.
- Optionally link larger items to `product/initiatives/<slug>.md`.
- If `product/backlog.md` already exists, update it instead of creating new backlog documents.
- Do not create backlog artifacts unless the user asks for repo-backed tracking or the repo already uses them.

## OpenSpec compatibility
- Keep backlog state outside `openspec/specs/` and `openspec/changes/`. OpenSpec tracks behavior and active changes, not portfolio state.
- In OpenSpec-aware repos, backlog items should link to a change folder when work has crossed into active planning or implementation:
  - discovery only: no change yet
  - scoped and approved: `openspec/changes/<change-id>/`
  - completed: archived change or synced capability spec
- Use backlog status and OpenSpec lifecycle together when helpful:
  - `Next` or `In progress` for priority
  - proposal, specs, design, tasks, apply, archive for change maturity
- If the repo uses OpenSpec only for some domains, keep backlog tracking unified and link only the items that actually have change artifacts.

## Backlog management approach
- Start from current state, not an idealized plan.
- Normalize work into clear states such as done, in progress, next, blocked, later, or dropped.
- Keep prioritization rationale explicit.
- Reflect changes in assumptions, dependencies, or business context.
- Separate committed work from candidate work.
- Call out items that should move, merge, split, pause, or drop.
- Keep the backlog decision-useful, not exhaustive.

## Output format
Prefer this structure unless asked otherwise:

1. **Summary** — what changed and why
2. **Current state** — done, in progress, next, blocked, later, dropped
3. **Priority changes** — what moved up, down, in, or out
4. **Roadmap impact** — milestone or sequencing changes
5. **Risks and dependencies** — blockers, gaps, watch items
6. **Recommendation** — what to do next and what to defer

## Repo artifact expectations
When using `repo-artifacts`, prefer this structure in `product/backlog.md`:

1. **In progress**
2. **Next**
3. **Blocked**
4. **Later**
5. **Done (recent)**
6. **Dropped**

Each item should stay short and include:
- id
- title
- status
- priority
- roadmap or initiative link when relevant
- OpenSpec change or capability link when relevant
- next step or blocker note

## Check
- Is the current state accurate?
- Are statuses normalized and clear?
- Is prioritization rationale visible?
- Are blocked or stale items called out?
- Does the backlog reflect roadmap intent?
- Is the next work obvious?
- In OpenSpec-aware repos, are active changes linked without turning the backlog into a duplicate of `tasks.md`?
