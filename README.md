# Agent Engineering Playbook

A personal, curated library of skills, agent instructions, MCP configurations, and permissions for use across coding-agent harnesses. Maintain reusable content here and keep harness-specific configuration in its native format.

## Contents

| Location | Purpose |
|---|---|
| [agents/default/AGENTS.md](agents/default/AGENTS.md) | Shared working preferences and coding defaults |
| [skills/](skills/) | Six focused, reusable task skills |
| [mcp/](mcp/README.md) | Catalogue of MCP server entries with placeholders |
| [permissions/](permissions/README.md) | Native permission configurations per harness |

## Skills

| Skill | Use it for |
|---|---|
| [nurvel-product-planning](skills/nurvel-product-planning/SKILL.md) | Discovery, requirements, acceptance criteria, and story slicing for a feature |
| [nurvel-technical-planning](skills/nurvel-technical-planning/SKILL.md) | Technical discovery, implementation approach, verification plans, handoffs, and implementation reports |
| [nurvel-roadmap](skills/nurvel-roadmap/SKILL.md) | Priorities, milestones, and backlog state across initiatives |
| [nurvel-bugfix](skills/nurvel-bugfix/SKILL.md) | Diagnosis, minimal fixes, and regression verification |
| [nurvel-refactor](skills/nurvel-refactor/SKILL.md) | Structural improvements that preserve behavior |
| [nurvel-review](skills/nurvel-review/SKILL.md) | Reviews of code, content, plans, skills, configurations, and processes; optional scoring |

Choose skills by their descriptions and the task at hand. Each works independently; there is no required sequence.

Ordinary feature implementation, component work, API integration, and test writing use the shared defaults and the target project's conventions. They do not require separate skills.

## Optional detail

Product and technical planning include reference templates for named outputs such as briefs, specs, discovery notes, handoffs, and implementation reports. Review includes a scoring guide. Load these only when the requested output needs them.

## Maintaining the library

- Keep one authoritative copy of each shared skill, with the folder name matching its frontmatter `name`.
- Put the purpose and activation conditions in `description`; keep task guidance in the body.
- Add a skill when a distinct, repeated task needs guidance beyond the shared defaults. Combine overlapping guidance and remove rules that add no useful behavior.
- Keep skills self-contained and avoid hardcoded harness installation paths or unnecessary tool dependencies.
- Put substantial, conditional templates or procedures in linked references.
- Keep this skill catalog current when names or scope change, and keep the shared defaults consistent with the skills.
- Keep MCP and permission entries as a catalogue: placeholders instead of secrets or machine-specific values.
- Check metadata, local links, and representative task routing after changes.

## Setup

This repository is a catalogue; nothing here is active until it is placed in a harness. Apply the parts a machine or project needs, manually or by asking an agent to do it.

| Content | Claude Code | Codex |
|---|---|---|
| [agents/default/AGENTS.md](agents/default/AGENTS.md) | `~/.claude/CLAUDE.md` | `~/.codex/AGENTS.md` |
| `skills/<name>/` | `~/.claude/skills/<name>/` | `~/.agents/skills/<name>/` |
| [mcp/catalog.json](mcp/catalog.json) entries | Project `.mcp.json` or `claude mcp add-json` | `[mcp_servers.<name>]` in `~/.codex/config.toml` |
| [permissions/](permissions/README.md) | `~/.claude/settings.json` or project `.claude/settings.json` | `~/.codex/config.toml` and `~/.codex/rules/` |

- Symlink instructions and skills to pick up changes from this repository; copy them when a machine needs local edits.
- Remove superseded skills from the target so that overlapping descriptions do not compete.
- Merge MCP and permission entries into existing configuration instead of overwriting it, and replace placeholders per machine or project.
