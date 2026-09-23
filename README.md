# Agent Engineering Playbook

A personal, curated library of skills, agent instructions, MCP configurations, and permissions for use across coding-agent harnesses. Maintain reusable content here and keep harness-specific configuration in its native format.

## Contents

| Location | Purpose |
|---|---|
| [agents/default/AGENTS.md](agents/default/AGENTS.md) | Shared working preferences and coding defaults |
| [skills/](skills/) | Six focused, reusable task skills |
| [mcp/](mcp/) | Curated MCP configuration |
| [permissions/](permissions/README.md) | Native permission configurations and guidance for keeping them aligned |

## Skills

| Skill | Use it for |
|---|---|
| [nurvel-product-planning](skills/nurvel-product-planning/SKILL.md) | Discovery, requirements, acceptance criteria, and story slicing for a feature |
| [nurvel-technical-planning](skills/nurvel-technical-planning/SKILL.md) | Technical discovery, implementation approach, verification plans, and handoffs |
| [nurvel-roadmap](skills/nurvel-roadmap/SKILL.md) | Priorities, milestones, and backlog state across initiatives |
| [nurvel-bugfix](skills/nurvel-bugfix/SKILL.md) | Diagnosis, minimal fixes, and regression verification |
| [nurvel-refactor](skills/nurvel-refactor/SKILL.md) | Structural improvements that preserve behavior |
| [nurvel-review](skills/nurvel-review/SKILL.md) | Reviews of code, content, plans, skills, configurations, and processes; scoring when requested |

Choose skills by their descriptions and the task at hand. Each works independently; there is no required sequence. Reviews are read-only unless changes are requested.

Ordinary feature implementation, component work, API integration, and test writing use the shared defaults and the target project's conventions. They do not require separate skills.

## Optional detail

Product and technical planning include reference files for named blueprint outputs. Review includes references for scoring and implementation reports. Load these only when the requested output needs them.

Prefer the target project's existing source of truth and formats, including its OpenSpec conventions when applicable. Return analysis in chat unless a file update is requested.

## Maintaining the library

- Keep one authoritative copy of each shared skill, with the folder name matching its frontmatter `name`.
- Put the purpose and activation conditions in `description`; keep task guidance in the body.
- Add a skill when a distinct, repeated task needs guidance beyond the shared defaults. Combine overlapping guidance and remove rules that add no useful behavior.
- Keep skills self-contained and avoid hardcoded harness installation paths or unnecessary tool dependencies.
- Put substantial, conditional templates or procedures in linked references.
- Keep this skill catalog current when names or scope change, and keep the shared defaults consistent with the skills.
- Check metadata, local links, and representative task routing after changes.

## Installation

This repository is the content source; placing a file here does not activate it in a harness. Use each harness's supported setup to consume the relevant content.

The existing [install-playbook.sh](install-playbook.sh) still targets the previous `dist/` layout and needs a separate update before use.
