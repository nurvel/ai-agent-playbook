# Agent Tooling Principles

## Summary
Agent tooling should be portable, concise, pragmatic, and compatible with multiple coding harnesses where practical.

## Guidance
- Keep `dist/` agent-agnostic unless a harness-specific adapter is explicitly needed.
- Optimize runtime files for token efficiency without losing decision quality.
- Treat MCP/tool guidance as optional capability guidance, not a hard dependency.
- Prefer install/link models that make local iteration fast and reduce copied stale files.
- Evaluate non-native harnesses such as opencode before coupling the repo to one agent's assumptions.

## Distilled Runtime Outputs
- `dist/AGENTS.md`: agent behavior, MCP usage, communication, and task execution defaults.
- `dist/skills/*/SKILL.md`: concise task-specific guidance.

## Open Questions
- Should the installer support symlinks as the default, or as an opt-in mode beside copy-based install?
- Should skills use a visible prefix such as `nurvel-*` for menu clarity, or stay generic for portability?

