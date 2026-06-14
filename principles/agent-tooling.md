# Agent Tooling Principles

## Summary
Agent tooling should be portable, concise, pragmatic, and compatible with multiple coding harnesses where practical.

## Guidance
- Keep `dist/` agent-agnostic unless a harness-specific adapter is explicitly needed.
- Optimize runtime files for token efficiency without losing decision quality.
- Treat MCP/tool guidance as optional capability guidance, not a hard dependency.
- Use the `nurvel-` prefix for portable runtime skills so their origin is visible in agent menus and mixed skill directories.
- Keep `dist/` skills as generic base skills. Project-specific and domain-specific extensions should usually live in the target project or user skill directory, not in this base package.
- Promote extension behavior into `dist/` only when it improves the generic base guidance for many projects.
- Prefer install/link models that make local iteration fast and reduce copied stale files.
- Evaluate non-native harnesses such as opencode before coupling the repo to one agent's assumptions.
- Keep rationale, comparisons, and migration notes in `principles/` or `planning/`; runtime files should carry only the instructions agents need during work.

## Distilled Runtime Outputs
- `dist/AGENTS.md`: agent behavior, MCP usage, communication, and task execution defaults.
- `dist/skills/nurvel-*/SKILL.md`: concise task-specific base guidance.

## Open Questions
- Should the installer support symlinks as the default, or as an opt-in mode beside copy-based install?
