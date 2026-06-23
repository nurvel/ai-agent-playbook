# Agent Engineering Playbook

Personal, agent-agnostic toolbox for coding agents and software work. It combines deployable agent guidance with repo-only principles from coding, architecture, product management, workflows, and agent tooling.

The portable agent package is `dist/AGENTS.md` + `dist/skills/nurvel-<name>/SKILL.md`. The contents of `dist/` are hand-authored source files, not generated build output.

Root `AGENTS.md`, `principles/`, `planning/`, `repo-skills/`, `scripts/`, and this `README.md` are repo support files. They are not installed into Codex or Claude by the playbook installer.

## Structure

```
AGENTS.md              <- repo-local instructions for agents working here

dist/
  AGENTS.md              <- universal coding principles and defaults
  skills/nurvel-<name>/SKILL.md <- task-specific guidance with triggers and MCP linkages

principles/
  README.md              <- repo-only knowledge layer and compression model
  coding.md              <- coding quality and maintainability principles
  architecture.md        <- architecture boundaries and visualization principles
  product-management.md  <- discovery, requirements, and prioritization principles
  agent-tooling.md       <- agent and harness tooling principles
  workflows.md           <- idea-to-delivery workflow principles

repo-skills/
  README.md              <- repo-local skills for maintaining this toolbox

planning/
  README.md              <- repo-internal planning notes
  requirements.md        <- requirements index and durable project contract
  requirements/<id>-<slug>.md <- implementation-ready requirement details
  reports/               <- one-off audits, analysis, and design outputs
  roadmap.md             <- roadmap for improving this playbook
  backlog.md             <- operational backlog for this repo

scripts/
  install-playbook.sh    <- syncs dist/ into user-level agent folders
```

## How to use

1. Point your agent at `dist/AGENTS.md` as the baseline behavior guide and skill router.
2. Skills are selected from their YAML frontmatter (`name`, `triggers`, optional `mcp_servers`).
3. `mcp_servers` is a hint, not a requirement - use the server when it adds value, skip it when the codebase alone is enough.
4. Runtime skill names use the `nurvel-` prefix so they are identifiable in agent menus.

## Knowledge Model

`principles/` explains the thinking behind the runtime output. It can be detailed, opinionated, and traceable.

`dist/` is the compressed runtime layer. It should contain only the guidance that improves agent behavior during normal work.

Traceability flows one way: principle pages may list the runtime files they inform, but runtime files should not reference `principles/` directly.

`repo-skills/` is for skills that maintain this repository itself. These skills are not part of the portable package.

### Install to Codex or Claude

The install script syncs `dist/` into user-level agent folders. It updates matching files and overwrites older versions of the same skills, but never deletes unrelated files from `~/.agents` or `~/.claude`.

Migration note: installs made before the `nurvel-` prefix rename may leave old unprefixed skill folders beside the new prefixed folders because the installer intentionally does not delete extra destination files.

```bash
scripts/install-playbook.sh              # both agents
scripts/install-playbook.sh --codex      # Codex only
scripts/install-playbook.sh --claude     # Claude only
scripts/install-playbook.sh --dry-run    # preview without writing
```

## Internal Planning

Use `planning/` only for work about this repository and the package it produces. It should describe what needs to change in the playbook, not content that should be copied into installed agent folders.

## Target-Project Product Artifacts

- `product/roadmap.md` — strategic view: goals, horizons, milestones, `Now / Next / Later`
- `product/backlog.md` — operational view: `In progress / Next / Blocked / Later / Done / Dropped`
- `product/initiatives/<slug>.md` — larger initiative with one durable scope and decision-history artifact
- `product/initiatives/<slug>/` — multi-blueprint initiative folder for separate artifacts such as idea brief, requirements, technical discovery, implementation handoff, implementation report, and post-implementation learning

The shipped roadmap, backlog, and workflow guidance support these optional files in target projects. If Jira, Linear, or another tool is already the source of truth for a target project, use `chat-only` mode and keep that project clean.

## Workflow Phase Mapping

| Phase | Artifact | Owner / support |
|---|---|---|
| Idea Brief | `idea-brief.md` | `nurvel-product-discovery` |
| Requirement Refinement | `requirements-blueprint.md` or `product-spec.md` | `nurvel-requirements-definition` |
| Technical Discovery | `technical-blueprint.md` | `nurvel-planning`; `nurvel-code-review` can review |
| Implementation Handoff | `implementation-handoff.md` | `nurvel-planning`; `nurvel-story-slicing` and `nurvel-test-writing` support |
| Implementation Report | `implementation-report.md` | `nurvel-code-review`; `nurvel-backlog-management` supports follow-up |
| Post-Implementation Learning | `post-implementation-learning.md` | Workflow artifact; `nurvel-backlog-management` supports follow-up until repo-local skill evolution exists |

## OpenSpec compatibility

The playbook is OpenSpec-aware, not OpenSpec-dependent.

This repository does not currently use OpenSpec for its own planning. OpenSpec guidance here is for target projects that install or adapt `dist/`.

- `openspec/specs/` — current agreed behavior
- `openspec/changes/<change-id>/` — active proposal, design, tasks, spec deltas
- `product/roadmap.md` / `product/backlog.md` remain optional planning overlays above OpenSpec

In OpenSpec-adopted repos, use OpenSpec for: discovery handoff into change planning, requirements as proposal + spec deltas, slicing as `tasks.md`. Keep roadmap and backlog outside OpenSpec — they should reference change ids and capability specs, not replace them. If a project ships its own OpenSpec skills, those are primary for change-file workflows; this playbook's PO skills stay as a companion layer for discovery, scoping, prioritization, and slicing quality.

## Example flows

- **Fixing a browser bug** - `nurvel-bugfix` + `chrome-devtools` + `nurvel-test-writing`
- **New UI from Figma** - `nurvel-planning` + `nurvel-new-component` + `figma`
- **API integration** - `nurvel-api-integration` + `context7` (for library docs)
- **New feature shaping** - `nurvel-product-discovery` -> `nurvel-requirements-definition` -> `nurvel-story-slicing`
- **Workflow blueprint handoff** - `nurvel-product-discovery` -> `nurvel-requirements-definition` -> `nurvel-planning` -> `nurvel-code-review`
- **Roadmap upkeep** - `nurvel-backlog-management` -> `nurvel-roadmap-planning`

Each flow ends with validation: types, lint, and relevant tests.

## Skills

| Skill | Purpose |
|---|---|
| `nurvel-planning` | Plan implementation approach; owns technical blueprint and implementation handoff outputs |
| `nurvel-product-discovery` | Analyze what should be built and why; owns idea brief output |
| `nurvel-requirements-definition` | Turn a validated idea into clear scope and acceptance criteria; owns requirements blueprint and product spec outputs |
| `nurvel-roadmap-planning` | Sequence initiatives into milestones and MVP phases; uses workflow artifacts as input |
| `nurvel-backlog-management` | Maintain current priorities, progress, and next work; supports report and learning follow-up |
| `nurvel-story-slicing` | Break defined work into small implementation-ready stories; supports implementation handoff |
| `nurvel-bugfix` | Fix bugs, debug regressions |
| `nurvel-new-component` | Create React/UI components |
| `nurvel-api-integration` | Add API calls, wire data to UI |
| `nurvel-refactor` | Restructure code without changing behavior |
| `nurvel-test-writing` | Add or improve tests; supports implementation handoff test plans |
| `nurvel-code-review` | Review code or plans for quality; owns implementation report output |
| `nurvel-evaluation` | Score a target `0-10`, explain why, state what raises it to the next level |

## Adding a new skill

Create `dist/skills/nurvel-<name>/SKILL.md` (folder name matches the frontmatter `name`):

```yaml
---
name: nurvel-<skill-name>
description: <one-line purpose>
triggers:
  - <keyword that should activate this skill>
mcp_servers:          # optional — only if the skill benefits from an MCP server
  - <server-name>
---
```

Below the frontmatter, include: `When to use`, task-specific guidance, and a `Check` section. See existing skills for reference.

Project-specific or domain-specific extensions should usually live outside `dist/` and use their own naming convention. Promote behavior into `dist/` only when it is useful as generic base guidance.

## Limitations

This playbook does not:
- **Orchestrate agents** - it provides guidelines, not runtime coordination
- **Enforce rules** - the agent is expected to follow the guidance, not be constrained by it
- **Cover all task types** - skills are added as needed, not upfront
- **Replace project-specific config** - use alongside your project's own conventions (e.g. `CLAUDE.md`, `.cursorrules`)

## Design principles

- **Generic** - agent-agnostic; skills may be technology-specific
- **Composable** - skills can be combined per task
- **Minimal** - only what adds value, no bloat
- **Opinionated** - clear defaults, not endless options
