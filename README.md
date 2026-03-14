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
4. MCP servers extend agent capabilities when skills reference them

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

## Design principles

- **Generic** — agent-agnostic; skills may be technology-specific
- **Composable** — skills can be combined per task
- **Minimal** — only what adds value, no bloat
- **Opinionated** — clear defaults, not endless options
