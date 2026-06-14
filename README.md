# AI Agent Playbook

Generic, agent-agnostic guidelines for coding agents. Works with any LLM agent that can read markdown. The playbook is framework-neutral; individual skills may target specific technologies (e.g. React).

The portable agent package is `dist/AGENTS.md` + `dist/skills/<name>/SKILL.md`. The contents of `dist/` are hand-authored source files, not generated build output.

This `README.md`, `scripts/`, and `planning/` are repo support files. They are not installed into Codex or Claude by the playbook installer.

## Structure

```
dist/
  AGENTS.md              <- universal coding principles and defaults
  skills/<name>/SKILL.md <- task-specific guidance with triggers and MCP linkages

planning/
  README.md              <- repo-internal planning notes
  roadmap.md             <- roadmap for improving this playbook
  backlog.md             <- operational backlog for this repo
  initiatives/<slug>.md  <- larger internal initiative notes

scripts/
  install-playbook.sh    <- syncs dist/ into user-level agent folders
```

## How to use

1. Point your agent at `dist/AGENTS.md` as the baseline behavior guide and skill router.
2. Skills are selected from their YAML frontmatter (`triggers`, optional `mcp_servers`).
3. `mcp_servers` is a hint, not a requirement - use the server when it adds value, skip it when the codebase alone is enough.

### Install to Codex or Claude

The install script syncs `dist/` into user-level agent folders. It updates matching files and overwrites older versions of the same skills, but never deletes unrelated files from `~/.agents` or `~/.claude`.

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
- `product/initiatives/<slug>.md` — only for larger initiatives that need their own scope and decision history

The shipped roadmap and backlog skills support these optional files in target projects. If Jira, Linear, or another tool is already the source of truth for a target project, use `chat-only` mode and keep that project clean.

## OpenSpec compatibility

The playbook is OpenSpec-aware, not OpenSpec-dependent.

- `openspec/specs/` — current agreed behavior
- `openspec/changes/<change-id>/` — active proposal, design, tasks, spec deltas
- `product/roadmap.md` / `product/backlog.md` remain optional planning overlays above OpenSpec

In OpenSpec-adopted repos, use OpenSpec for: discovery handoff into change planning, requirements as proposal + spec deltas, slicing as `tasks.md`. Keep roadmap and backlog outside OpenSpec — they should reference change ids and capability specs, not replace them. If a project ships its own OpenSpec skills, those are primary for change-file workflows; this playbook's PO skills stay as a companion layer for discovery, scoping, prioritization, and slicing quality.

## Example flows

- **Fixing a browser bug** - `bugfix` + `chrome-devtools` + `test-writing`
- **New UI from Figma** - `planning` + `new-component` + `figma`
- **API integration** - `api-integration` + `context7` (for library docs)
- **New feature shaping** - `product-discovery` -> `requirements-definition` -> `story-slicing`
- **Roadmap upkeep** - `backlog-management` -> `roadmap-planning`

Each flow ends with validation: types, lint, and relevant tests.

## Skills

| Skill | Purpose |
|---|---|
| `planning` | Plan implementation approach before coding |
| `product-discovery` | Analyze what should be built and why |
| `requirements-definition` | Turn a validated idea into clear scope and acceptance criteria |
| `roadmap-planning` | Sequence initiatives into milestones and MVP phases |
| `backlog-management` | Maintain current priorities, progress, and next work |
| `story-slicing` | Break defined work into small implementation-ready stories |
| `bugfix` | Fix bugs, debug regressions |
| `new-component` | Create React/UI components |
| `api-integration` | Add API calls, wire data to UI |
| `refactor` | Restructure code without changing behavior |
| `test-writing` | Add or improve tests |
| `code-review` | Review code or plans for quality |
| `evaluation` | Score a target `0-10`, explain why, state what raises it to the next level |

## Adding a new skill

Create `dist/skills/<name>/SKILL.md` (folder name matches the frontmatter `name`):

```yaml
---
name: <skill-name>
description: <one-line purpose>
triggers:
  - <keyword that should activate this skill>
mcp_servers:          # optional — only if the skill benefits from an MCP server
  - <server-name>
---
```

Below the frontmatter, include: `When to use`, task-specific guidance, and a `Check` section. See existing skills for reference.

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
