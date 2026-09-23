# Agent Engineering Playbook

A personal, curated library of skills, agent instructions, MCP descriptions, and permission intent for use across coding-agent harnesses. Reusable behavior lives here; harness-specific configuration is generated when needed from current official documentation.

## Contents

| Location | Purpose |
|---|---|
| [agents/default/AGENTS.md](agents/default/AGENTS.md) | Shared working preferences and coding defaults |
| [skills/](skills/) | Six focused, reusable task skills |
| [mcp/](mcp/README.md) | Harness-neutral MCP catalogue and configuration requirements |
| [permissions/](permissions/README.md) | Harness-neutral personal permission policy |

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
- Keep MCP and permission documents harness-neutral. Describe intent, prerequisites, risks, and required behavior rather than copying a harness's current configuration syntax.
- Keep secrets and machine-specific values out of the repository.
- Check metadata, local links, and representative task routing after changes.

## Setup

This repository is a catalogue; nothing here is active until it is placed in a harness.

| Content | Claude Code | Codex |
|---|---|---|
| [agents/default/AGENTS.md](agents/default/AGENTS.md) | `~/.claude/CLAUDE.md` | `~/.codex/AGENTS.md` |
| `skills/<name>/` | `~/.claude/skills/<name>/` | `~/.agents/skills/<name>/` |
| [MCP catalogue](mcp/README.md) | Translate selected entries to the current native MCP format | Translate selected entries to the current native MCP format |
| [Permission policy](permissions/README.md) | Translate policy intent to current native permissions | Translate policy intent to current native permissions and sandbox controls |

For instructions and skills, symlink them to pick up changes from this repository or copy them when a machine needs local edits. Remove superseded skills so overlapping descriptions do not compete.

For MCP and permissions, ask an agent to:

1. inspect the installed harness version and existing configuration;
2. consult the current official harness and server documentation;
3. translate only the selected catalogue entries and policy intent into native configuration;
4. distinguish enforced behavior from approval-gated or unsupported behavior;
5. propose a minimal merge without overwriting unrelated settings; and
6. validate the resulting configuration with the harness's current checks.

Configuration generation does not authorize installation. Review the proposed native change before asking the agent to apply it.