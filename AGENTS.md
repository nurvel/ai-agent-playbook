# Agent Engineering Playbook Repo Guide

## Purpose
This repository builds and maintains the Agent Engineering Playbook.

The main output is the portable agent package in `dist/`. The rest of the repo exists to shape, justify, plan, and maintain that output.

## Repo Layers
- `dist/` - deployable runtime package: `AGENTS.md` and `skills/**`.
- `principles/` - repo-only source knowledge, rationale, lessons, and tradeoffs.
- `planning/` - roadmap, backlog, durable requirements, and detailed requirement files.
- `repo-skills/` - repo-local maintenance skills, not part of the portable package.
- `scripts/` - repo support automation.

Do not treat root `AGENTS.md` as portable output. `dist/AGENTS.md` is the installed guide.

## Default Workflow
Before changing behavior, structure, skills, or installer logic:

1. Read `planning/README.md`.
2. Check `planning/backlog.md` for the active item.
3. Read `planning/requirements.md`.
4. If the backlog item has a detailed file, read `planning/requirements/<id>-<slug>.md`.
5. Check relevant `principles/*.md` for rationale.

If the request is broad or strategic, refine `planning/` first instead of editing `dist/` directly.

## Working With Principles
- Add learnings, rationale, examples, and caveats to `principles/`.
- Keep principles detailed enough to preserve reasoning.
- Use `principles/_template.md` for new principle pages.
- Principles may point to runtime outputs they inform.
- Runtime files in `dist/` should not reference `principles/`.

## Working With Dist
- Keep `dist/` concise, agent-agnostic, and runtime-focused.
- Do not add long rationale, personal notes, or planning history to `dist/`.
- Preserve target-project compatibility guidance when it is useful, even if this repo does not use that tool.
- When changing a skill, keep frontmatter triggers clear and the body small.
- Prefer improving an existing skill over creating a new one unless the job is genuinely distinct.

## Working With Planning
- `planning/requirements.md` is the index and durable project contract.
- Detailed requirements live in `planning/requirements/<id>-<slug>.md`.
- `planning/backlog.md` stays short: status, priority, roadmap link, next step.
- `planning/roadmap.md` stays strategic: Now, Next, Later, Done, risks.
- Do not reintroduce OpenSpec artifacts for this repo unless explicitly requested.
- OpenSpec references in `dist/` are target-project compatibility guidance.

## Working With Repo Skills
- Use `repo-skills/` only for skills that maintain this repository.
- Do not install `repo-skills/` by default.
- Planned repo-local skill: `repo-skills/skill-evolution/SKILL.md`.
- Use repo-local skills to process learnings or retros into `principles/`, `planning/`, or proposed `dist/` changes.

## Skill Use Inside This Repo
- When a task maps to an existing skill in `dist/skills/`, read that skill and use it as guidance.
- For planning work, prefer `planning`, `product-discovery`, `requirements-definition`, `backlog-management`, or `roadmap-planning`.
- For runtime skill changes, use `skill-creator` guidance if available and keep token cost low.
- For reviews, use `code-review` and lead with concrete issues.

## Change Discipline
- Do the smallest useful change.
- Keep `dist/`, `principles/`, `planning/`, and `repo-skills/` responsibilities separate.
- Update planning when a change alters priority, scope, or accepted requirements.
- Update principles when a change encodes a durable belief or lesson.
- Update `dist/` only when runtime agent behavior should change.
- Avoid ad hoc files unless the folder model requires them.

## Validation
- Always run `git diff --check` after edits.
- For installer changes, also run:
  - `bash -n scripts/install-playbook.sh`
  - `scripts/install-playbook.sh --dry-run --codex`
  - `scripts/install-playbook.sh --dry-run --claude`
- For docs-only changes, inspect affected files for stale paths and old terminology.
- If a check cannot be run, say so.

