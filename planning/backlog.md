# Playbook Backlog

Use short items. Keep the backlog decision-useful, not exhaustive.

## In progress
- None

## Next
- `B3` Audit `dist/` for agent-specific assumptions
  - Status: next
  - Priority: high
  - Link: roadmap `R3`
  - OpenSpec change:
  - Next step: Identify Claude/Codex-specific wording, paths, or behavior that weakens portability.

- `B4` Design symlink-based install mode
  - Status: next
  - Priority: high
  - Link: roadmap `R3`
  - OpenSpec change:
  - Next step: Map Codex, Claude, Gemini, and opencode file/link expectations before changing the installer.

- `B5` Define generic vs domain skill extension model
  - Status: next
  - Priority: high
  - Link: roadmap `R4`
  - OpenSpec change:
  - Next step: Decide how base skills should be extended by project-specific or domain-specific skills.

- `B6` Decide skill naming and prefix strategy
  - Status: next
  - Priority: medium
  - Link: roadmap `R4`
  - OpenSpec change:
  - Next step: Compare generic names with a visible origin prefix such as `nurvel-*` in agent menus.

## Blocked
- None

## Later
- `B7` Extract MCP and tool guidance model
  - Status: later
  - Priority: medium
  - Link: roadmap `R4`
  - OpenSpec capability:
  - Note: Decide whether MCP/tool guidance belongs in skill frontmatter, a `dist/tools/` folder, or separate adapter docs.

- `B8` Define high-level workflow layer
  - Status: later
  - Priority: medium
  - Link: roadmap `R5`
  - OpenSpec capability:
  - Note: Cover Idea Brief, Requirement Refinement, Technical Discovery, Implementation Handoff, and Implementation Report.

- `B9` Design feedback/retro skill
  - Status: later
  - Priority: medium
  - Link: roadmap `R6`
  - OpenSpec capability:
  - Note: Capture feedback from real skill usage back into this repo without bloating runtime guidance.

- `B10` Evaluate non-native harnesses
  - Status: later
  - Priority: medium
  - Link: roadmap `R3`
  - OpenSpec capability:
  - Note: Test opencode and other markdown-reading coding agents before adding harness-specific assumptions.

- `B11` Add architecture visualization support
  - Status: later
  - Priority: medium
  - Link: roadmap `R7`
  - OpenSpec capability:
  - Note: Evaluate C4, ArchiMate, and lighter alternatives for planning and documentation skills.

- `B12` Run token and pragmatism cleanup pass
  - Status: later
  - Priority: medium
  - Link: roadmap `R4`
  - OpenSpec capability:
  - Note: Compress `dist/` after principles are captured so runtime guidance stays lean.

- `B13` Add release note convention
  - Status: later
  - Priority: low
  - Link:
  - OpenSpec capability:
  - Note: Keep lightweight unless package consumers need versioned change history.

## Done (recent)
- `B2` Establish principles-backed toolbox foundation
  - Status: done
  - Completed: 2026-06-14
  - OpenSpec archive:
  - Outcome: Added `principles/`, `planning/requirements.md`, and updated README, roadmap, and backlog around the three-layer model.

- `B1` Restructure repository boundaries
  - Status: done
  - Completed: 2026-06-14
  - OpenSpec archive:
  - Outcome: Portable output moved to `dist/`; repo planning moved to `planning/`.

## Dropped
- None
