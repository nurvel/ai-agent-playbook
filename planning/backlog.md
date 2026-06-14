# Agent Engineering Playbook Backlog

Use short items. Keep the backlog decision-useful, not exhaustive.

## In progress
- None

## Next
- `B8` Define high-level workflow layer
  - Status: next
  - Priority: medium
  - Link: roadmap `R5`
  - Requirement: `planning/requirements/b8-high-level-workflow-layer.md`
  - Source: `planning/reports/b8-workflow-layer-design.md`
  - Next step: Review the B8 design report, then implement the accepted concise runtime guidance.

## Blocked
- None

## Later
- `B9` Design repo-local skill evolution skill
  - Status: later
  - Priority: medium
  - Link: roadmap `R6`
  - Note: Create `repo-skills/skill-evolution/SKILL.md` to process learning or retro input into principles, backlog, existing skills, or new runtime skill candidates.

- `B10` Evaluate non-native harnesses
  - Status: later
  - Priority: medium
  - Link: roadmap `R3`
  - Note: Test opencode and other markdown-reading coding agents before adding harness-specific assumptions.

- `B14` Implement symlink-based install mode
  - Status: later
  - Priority: high
  - Link: roadmap `R3`
  - Source: `planning/reports/b4-installer-design.md`
  - Note: Implement modular target adapters and independent `copy` / `link` install methods from the B4 design.

- `B11` Add architecture visualization support
  - Status: later
  - Priority: medium
  - Link: roadmap `R7`
  - Note: Evaluate C4, ArchiMate, and lighter alternatives for planning and documentation skills.

- `B12` Run token and pragmatism cleanup pass
  - Status: later
  - Priority: medium
  - Link: roadmap `R4`
  - Note: Compress `dist/` after principles are captured so runtime guidance stays lean.

- `B13` Add release note convention
  - Status: later
  - Priority: low
  - Note: Keep lightweight unless package consumers need versioned change history.

## Done (recent)
- `B7` Extract MCP and tool guidance model
  - Status: done
  - Completed: 2026-06-14
  - Outcome: Kept `mcp_servers` as optional frontmatter hints; deferred a separate `dist/tools/` artifact until harness evidence justifies it.

- `B6` Decide skill naming and prefix strategy
  - Status: done
  - Completed: 2026-06-14
  - Outcome: Renamed portable runtime skills to the `nurvel-*` prefix and documented the installer duplicate-folder migration note.

- `B5` Define generic vs domain skill extension model
  - Status: done
  - Completed: 2026-06-14
  - Outcome: Kept `dist/` skills as generic base guidance; project and domain extensions live outside the base package by default.

- `B4` Design symlink-based install mode
  - Status: done
  - Completed: 2026-06-14
  - Outcome: Produced `planning/reports/b4-installer-design.md`; chose modular Codex/Claude targets, independent copy/link methods, all-target install, and explicit fail-or-backup conflict behavior.

- `B3` Audit `dist/` for agent-specific assumptions
  - Status: done
  - Completed: 2026-06-14
  - Outcome: Produced `planning/reports/b3-dist-audit.md`; applied accepted wording fixes in `dist/`; deferred MCP/tool structure to `B7`, installer/harness support to `B4`/`B10`, and naming questions to `B6`.

- `B2` Establish principles-backed toolbox foundation
  - Status: done
  - Completed: 2026-06-14
  - Outcome: Added `principles/`, `planning/requirements.md`, and updated README, roadmap, and backlog around the three-layer model.

- `B1` Restructure repository boundaries
  - Status: done
  - Completed: 2026-06-14
  - Outcome: Portable output moved to `dist/`; repo planning moved to `planning/`.

## Dropped
- None
