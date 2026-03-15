# AI Agent Playbook

Generic, agent-agnostic guidelines for coding agents. Works with any LLM agent that can read markdown instructions. The playbook itself is framework-neutral; individual skills may target specific technologies (e.g. React).

This `README.md` is repo documentation for humans. The actual portable agent package is:
- `AGENTS.md`
- `skills/<name>/SKILL.md`

You typically do not need to move `README.md` into Codex or Claude. It exists here as an overview of the playbook itself.

## Structure

``` 
AGENTS.md        ← universal coding principles and defaults
skills/<name>/SKILL.md ← task-specific guidance with triggers and MCP linkages
```

Optional product artifacts for solo planning:

``` 
product/roadmap.md
product/backlog.md
product/initiatives/<slug>.md
```

## How to use

1. Point your agent to `AGENTS.md` as the baseline behavior guide and skill routing logic
2. Skills are selected based on task type — each has YAML frontmatter with `triggers` and optional `mcp_servers`
3. `mcp_servers` in skill frontmatter is a hint, not a hard requirement — use the server when it adds value, skip it when the codebase alone is sufficient

For roadmap and backlog work, you can use either:
- `chat-only` mode — keep the output in chat and copy it to Jira, Linear, Notion, or elsewhere yourself
- `repo-artifacts` mode — maintain lightweight markdown files in `product/`

### Example flows

**Fixing a browser bug** — `bugfix` + `chrome-devtools` + `test-writing`
1. Task matches `bugfix` → agent follows `skills/bugfix/SKILL.md`
2. Skill lists `chrome-devtools` → agent inspects the error in the browser
3. Fix affects critical logic → agent adds `test-writing`
4. Validate: types, lint, tests pass

**New UI from Figma** — `planning` + `new-component` + `figma`
1. Non-trivial component → agent starts with `planning`
2. Plan ready → agent follows `skills/new-component/SKILL.md`
3. Skill lists `figma` → agent fetches design specs and tokens
4. Validate

**API integration** — `api-integration` + `context7`
1. Task matches `api-integration` → agent follows `skills/api-integration/SKILL.md`
2. Unfamiliar library → agent uses `context7` to look up current API docs
3. Validate

**New feature shaping** — `product-discovery` + `requirements-definition` + `story-slicing`
1. Early idea or unclear opportunity → agent starts with `product-discovery`
2. Direction is validated → agent follows `requirements-definition`
3. Work needs implementation-ready slices → agent follows `story-slicing`

**Roadmap upkeep** — `backlog-management` + `roadmap-planning`
1. Priorities or delivery state changed → agent starts with `backlog-management`
2. Changes affect milestones or release order → agent follows `roadmap-planning`
3. Output stays at product planning level, not sprint-task detail

## Optional product artifact model

Use this only when you want the repo to carry lightweight product state.

- `product/roadmap.md` is the strategic view: goals, horizons, milestones, and `Now / Next / Later`
- `product/backlog.md` is the operational view: `In progress / Next / Blocked / Later / Done / Dropped`
- `product/initiatives/<slug>.md` is optional and only for larger initiatives that need their own scope and decision history

This model is intentionally small. If Jira, Linear, or another tool is already the source of truth, use `chat-only` mode and keep the repo clean.

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
| `evaluation` | Score a target `0-10`, explain why, and state what raises it to the next level |

## Adding a new skill

Create `skills/<name>/SKILL.md` with this structure:

```yaml
---
name: <skill-name>
description: <one-line purpose>
triggers:
  - <keyword that should activate this skill>
  - <another keyword>
mcp_servers:          # optional — only if the skill benefits from an MCP server
  - <server-name>
---
```

The folder name should match the frontmatter `name` value.

Below the frontmatter, include: `When to use`, task-specific guidance, a `Check` section, and a `Cross-reference` to `AGENTS.md`. See existing skills for reference.

## Limitations

This playbook does not:
- **Orchestrate agents** — it provides guidelines, not runtime coordination
- **Enforce rules** — the agent is expected to follow the guidance, not be constrained by it
- **Cover all task types** — skills are added as needed, not upfront
- **Replace project-specific config** — use this alongside your project's own conventions (e.g. `CLAUDE.md`, `.cursorrules`)

The agent is expected to use judgment for situations not covered by a skill.

## Design principles

- **Generic** — agent-agnostic; skills may be technology-specific
- **Composable** — skills can be combined per task
- **Minimal** — only what adds value, no bloat
- **Opinionated** — clear defaults, not endless options
