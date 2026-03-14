# AI Agent Playbook

Generic, agent-agnostic guidelines for coding agents. Works with any LLM agent that can read markdown instructions. The playbook itself is framework-neutral; individual skills may target specific technologies (e.g. React).

## Structure

```
AGENTS.md        ← universal coding principles and defaults
WORKFLOW.md      ← how to select and chain skills
MCP-SERVERS.md   ← available MCP services and when to use them
skills/          ← task-specific guidance with triggers and MCP linkages
```

## How to use

1. Point your agent to `AGENTS.md` as the baseline behavior guide
2. Point it to `WORKFLOW.md` for task routing logic
3. Skills are selected based on task type — each has YAML frontmatter with `triggers` and optional `mcp_servers`
4. `mcp_servers` in skill frontmatter is a hint, not a hard requirement — use the server when it adds value, skip it when the codebase alone is sufficient

### Example flows

**Fixing a browser bug** — `bugfix` + `chrome-devtools` + `test-writing`
1. Task matches `bugfix` → agent follows `skills/bugfix.md`
2. Skill lists `chrome-devtools` → agent inspects the error in the browser
3. Fix affects critical logic → agent adds `test-writing`
4. Validate: types, lint, tests pass

**New UI from Figma** — `planning` + `new-component` + `figma`
1. Non-trivial component → agent starts with `planning`
2. Plan ready → agent follows `skills/new-component.md`
3. Skill lists `figma` → agent fetches design specs and tokens
4. Validate

**API integration** — `api-integration` + `context7`
1. Task matches `api-integration` → agent follows `skills/api-integration.md`
2. Unfamiliar library → agent uses `context7` to look up current API docs
3. Validate

## Skills

| Skill | Purpose |
|---|---|
| `planning` | Plan implementation approach before coding |
| `bugfix` | Fix bugs, debug regressions |
| `new-component` | Create React/UI components |
| `api-integration` | Add API calls, wire data to UI |
| `refactor` | Restructure code without changing behavior |
| `test-writing` | Add or improve tests |
| `code-review` | Review code or plans for quality |

## MCP Servers

| Server | Purpose |
|---|---|
| `chrome-devtools` | Browser debugging and runtime inspection |
| `figma` | Design context from Figma files |
| `context7` | Library/framework documentation lookup |

## Adding a new skill

Create `skills/<name>.md` with this structure:

```yaml
---
name: <skill-name>
description: <one-line purpose>
triggers:
  - <keyword that should activate this skill>
  - <another keyword>
mcp_servers:          # optional — only if the skill benefits from an MCP server
  - <server-name>     # must match a server listed in MCP-SERVERS.md
---
```

Below the frontmatter, include: `When to use`, task-specific guidance, a `Check` section, and a `Cross-reference` to `AGENTS.md`. See existing skills for reference.

If you add a new MCP server, document it in `MCP-SERVERS.md` with command/URL, description, and relevant skills.

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
