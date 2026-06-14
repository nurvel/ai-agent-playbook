# Agent Engineering Playbook Roadmap

## Strategic objective
- Build a personal software/product/architecture toolbox whose runtime output is concise agent guidance, backed by traceable repo-only principles.

## Planning horizon
- `Now / Next / Later`

## Sequencing principles
- Preserve the runtime install contract.
- Keep `dist/` concise and agent-agnostic.
- Use `principles/` for rationale, examples, and long-form lessons.
- Promote only proven, useful guidance into runtime skills.

## Now
- `R3` Define package consumption and compatibility
  - Goal: Keep output agent-agnostic while evaluating symlink install and harness compatibility.
  - Why now: Install and harness assumptions affect naming, file layout, and runtime packaging.
  - Dependencies: `R2`
  - Exit criteria: Compatibility matrix and installer direction are decided.

## Next
- `R5` Define high-level workflow layer
  - Goal: Model Idea Brief, Requirement Refinement, Technical Discovery, Implementation Handoff, Implementation Report, and Post-Implementation Learning.
  - Why next: Workflow guidance coordinates skills without bloating every skill.
  - Dependencies: `R4`
  - Exit criteria: Each workflow step has purpose, inputs, outputs, recommended skills, and acceptance checks.

## Later
- `R6` Add feedback and evolution loop
  - Goal: Capture real usage feedback into improvements for principles, skills, and agent defaults.
  - Why later: Better after the core taxonomy and skill model are stable.
  - Dependencies: `R4`, `R5`
  - Exit criteria: Repo-local `skill-evolution` skill or workflow is ready to use after real tasks.

- `R7` Add architecture visualization support
  - Goal: Support pragmatic C4, ArchiMate, or equivalent architecture documentation/planning.
  - Why later: Needs clear workflow integration to avoid becoming diagram ceremony.
  - Dependencies: `R5`
  - Exit criteria: Architecture guidance has clear triggers, outputs, and visual notation defaults.

## Done (recent)
- `R4` Refine skill system model
  - Scope: Generic base skill boundaries, `nurvel-*` naming, optional tool hints, and runtime token budget.
  - Exit criteria: Skill authoring rules are explicit enough for consistent future additions.
- `R2` Principles-backed toolbox foundation
  - Scope: `principles/`, requirements, roadmap, and backlog.
  - Exit criteria: Runtime output, source knowledge, and planning state are clearly separated.
- `R1` Clear package boundary
  - Scope: `dist/`, `planning/`, README, and installer path updates.
  - Exit criteria: A new contributor can tell what gets installed without reading the installer.

## Risks and dependencies
- Risk: `dist/` can be mistaken for generated output.
- Risk: `principles/` can become a dumping ground unless page templates and distillation rules stay strict.
- Risk: Runtime skills can grow too verbose if rationale leaks into `dist/`.
