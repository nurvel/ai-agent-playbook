# Agent Engineering Playbook Backlog

Use short items. Keep the backlog decision-useful, not exhaustive.

## In progress
- None

## Next
- `B3` Audit `dist/` for agent-specific assumptions
  - Status: next
  - Priority: high
  - Link: roadmap `R3`
  - Next step: Produce the audit report defined in `planning/requirements/b3-agent-agnostic-dist-audit.md`.

- `B4` Design symlink-based install mode
  - Status: next
  - Priority: high
  - Link: roadmap `R3`
  - Next step: Produce the installer design defined in `planning/requirements/b4-symlink-install-mode.md`.

- `B5` Define generic vs domain skill extension model
  - Status: next
  - Priority: high
  - Link: roadmap `R4`
  - Next step: Decide how base skills should be extended by project-specific or domain-specific skills.

- `B6` Decide skill naming and prefix strategy
  - Status: next
  - Priority: medium
  - Link: roadmap `R4`
  - Next step: Compare generic names with a visible origin prefix such as `nurvel-*` in agent menus.

## Blocked
- None

## Later
- `B7` Extract MCP and tool guidance model
  - Status: later
  - Priority: medium
  - Link: roadmap `R4`
  - Note: Decide whether MCP/tool guidance belongs in skill frontmatter, a `dist/tools/` folder, or separate adapter docs.

- `B8` Define high-level workflow layer
  - Status: later
  - Priority: medium
  - Link: roadmap `R5`
  - Note: Cover Idea Brief, Requirement Refinement, Technical Discovery, Implementation Handoff, and Implementation Report.

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
