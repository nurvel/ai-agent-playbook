# R4 Skill System Model

## Summary
R4 settles the core skill-system rules needed before adding the high-level workflow layer.

Accepted decisions:
- `dist/` skills remain generic base skills.
- Runtime skill names use the exact `nurvel-` prefix.
- Project-specific and domain-specific extensions live outside the base package by default.
- `mcp_servers` remains optional frontmatter metadata.
- No `dist/tools/` artifact or adapter-doc layer is added in this pass.
- Runtime files stay concise; rationale belongs in `principles/` or planning reports.

## Extension Model
The base package should provide reusable engineering, product, review, and delivery guidance that applies across target projects. Local conventions, domain rules, company workflows, and project-specific tools should be added as local skills or project rules.

Promotion into `dist/` is appropriate only when the behavior is broadly useful as generic base guidance. Otherwise, extension behavior should stay outside the portable package so the package does not become a collection of personal or domain-specific branches.

## Naming Model
Portable runtime skills are prefixed with `nurvel-` in both folder names and frontmatter names.

This makes package origin visible when installed into shared agent skill menus, while preserving readable generic job names after the prefix. The rename is a public interface change:
- `dist/skills/planning/SKILL.md` becomes `dist/skills/nurvel-planning/SKILL.md`.
- `name: planning` becomes `name: nurvel-planning`.

Unprefixed aliases are not kept in `dist/`.

Migration note: the current copy installer intentionally does not delete extra destination files. Users who installed earlier unprefixed skills may see duplicate old skill entries until they manually remove the old folders or a future installer cleanup feature handles stale managed paths.

## Tool Hint Model
`mcp_servers` stays in skill frontmatter as optional capability guidance. Agents that understand it can use matching local tools. Agents that do not understand it can still read the markdown normally.

No separate `dist/tools/` artifact is added now because that would expand the package surface and likely require installer and harness-compatibility decisions. B10 can revisit this after non-native harness checks if the current hint model causes problems.

## Token Budget Rule
Runtime skill files should contain only guidance that improves agent behavior during normal work. They should not carry long rationale, comparison history, detailed migration notes, or repo planning context.

Use:
- `dist/AGENTS.md` for short routing and execution defaults.
- `dist/skills/nurvel-*/SKILL.md` for concise task-specific guidance.
- `principles/` for durable reasoning and tradeoffs.
- `planning/reports/` for one-off decisions, audits, and implementation reports.

## Follow-Up
B8 can proceed next because the workflow layer now has settled skill naming, extension boundaries, and tool-hint assumptions.

B12 remains a later cleanup pass. R4 sets the token rule but does not attempt a full runtime compression pass.
