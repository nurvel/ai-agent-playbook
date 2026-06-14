# Architecture Principles

## Summary
Architecture should make responsibilities, constraints, and tradeoffs visible enough that teams can make better local decisions.

## Guidance
- Start from the real system shape before introducing structure.
- Keep module, API, and ownership boundaries explicit.
- Document architecture when it prevents repeated explanation or risky misunderstanding.
- Prefer pragmatic diagrams over ceremony: C4, ArchiMate, dependency maps, or sequence diagrams are tools, not goals.
- Architecture guidance should connect to implementation handoff, not live as isolated documentation.

## Distilled Runtime Outputs
- `dist/AGENTS.md`: architecture fit, boundary preservation, and review lens.
- `dist/skills/planning/SKILL.md`: implementation planning and architecture decisions.
- `dist/skills/code-review/SKILL.md`: architecture and scope-fit review.

## Open Questions
- Which visualization method should be the default for agent-assisted architecture work: C4, ArchiMate, or a lighter repo-specific diagram convention?

