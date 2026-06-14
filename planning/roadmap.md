# Playbook Roadmap

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
- `R2` Establish the principles-backed toolbox model
  - Goal: Add `principles/` and durable requirements for the personal toolbox pivot.
  - Why now: Future skill work needs a clear source/rationale layer before more runtime guidance is added.
  - Dependencies: Completed `dist/` and `planning/` separation.
  - OpenSpec capability:
  - OpenSpec change:
  - Exit criteria: README, requirements, roadmap, and backlog describe the three-layer model.

## Next
- `R3` Define package consumption and compatibility
  - Goal: Keep output agent-agnostic while evaluating symlink install and harness compatibility.
  - Why next: Install and harness assumptions affect naming, file layout, and runtime packaging.
  - Dependencies: `R2`
  - OpenSpec capability:
  - OpenSpec change:
  - Exit criteria: Compatibility matrix and installer direction are decided.

- `R4` Refine skill system model
  - Goal: Define generic vs domain-specific skill boundaries, naming/prefix convention, MCP extraction, and token budget.
  - Why next: The runtime package needs tighter rules before expanding skills.
  - Dependencies: `R2`, `R3`
  - OpenSpec capability:
  - OpenSpec change:
  - Exit criteria: Skill authoring rules are explicit enough for consistent future additions.

- `R5` Define high-level workflow layer
  - Goal: Model Idea Brief, Requirement Refinement, Technical Discovery, Implementation Handoff, and Implementation Report.
  - Why next: Workflow guidance coordinates skills without bloating every skill.
  - Dependencies: `R4`
  - OpenSpec capability:
  - OpenSpec change:
  - Exit criteria: Each workflow step has purpose, inputs, outputs, recommended skills, and acceptance checks.

## Later
- `R6` Add feedback and evolution loop
  - Goal: Capture real usage feedback into improvements for principles, skills, and agent defaults.
  - Why later: Better after the core taxonomy and skill model are stable.
  - Dependencies: `R4`, `R5`
  - OpenSpec capability:
  - OpenSpec change:
  - Exit criteria: Repo-local `skill-evolution` skill or workflow is ready to use after real tasks.

- `R7` Add architecture visualization support
  - Goal: Support pragmatic C4, ArchiMate, or equivalent architecture documentation/planning.
  - Why later: Needs clear workflow integration to avoid becoming diagram ceremony.
  - Dependencies: `R5`
  - OpenSpec capability:
  - OpenSpec change:
  - Exit criteria: Architecture guidance has clear triggers, outputs, and visual notation defaults.

## Milestones
- `M1` Clear package boundary
  - Scope: `dist/`, `planning/`, README, and installer path updates.
  - Exit criteria: A new contributor can tell what gets installed without reading the installer.
- `M2` Principles-backed toolbox foundation
  - Scope: `principles/`, requirements, roadmap, and backlog.
  - Exit criteria: Runtime output, source knowledge, and planning state are clearly separated.

## Risks and dependencies
- Risk: `dist/` can be mistaken for generated output.
- Dependency: README must state that `dist/` is hand-authored.
- Risk: `principles/` can become a dumping ground unless page templates and distillation rules stay strict.
- Risk: Runtime skills can grow too verbose if rationale leaks into `dist/`.
