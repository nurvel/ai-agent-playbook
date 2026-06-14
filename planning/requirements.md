# Project Requirements

## Purpose
This repository is a personal AI-assisted software toolbox. It captures coding, architecture, product management, workflow, and agent-tooling principles from long-term professional practice, then compresses the runtime-relevant parts into agent guidance.

The primary deliverable remains the portable agent package in `dist/`.

## Core Requirements
- `dist/` must stay agent-agnostic and usable with Codex, Claude, Gemini, opencode, and similar markdown-reading coding agents where practical.
- `dist/AGENTS.md` and `dist/skills/**` must be concise enough for normal agent context use.
- `principles/` must remain repo-only source/rationale material and must not be installed by default.
- Traceability must flow from `principles/` to runtime outputs; runtime outputs must not carry source references that increase token cost.
- Skills must stay generic base skills unless a domain-specific boundary is explicitly introduced.
- The repo must support project-specific extension: users can derive local skills or project rules from these base skills.
- MCP/tooling guidance must be clear enough to extract or adapt without coupling every skill to every tool.
- Skill naming must make origin clear enough in agent menus without sacrificing portability.
- Repo-specific maintenance skills must live outside `dist/`, currently under `repo-skills/`.
- Content must stay pragmatic: no unused ceremony, no broad fluff, no skills that do not map to real usage.

## Candidate Capabilities
- Symlink-based install for faster iteration, if agent harnesses support it cleanly.
- Harness compatibility evaluation for Codex, Claude, Gemini, opencode, and similar tools.
- Feedback or retro workflow for turning real usage into repo improvements.
- High-level workflow layer: Idea Brief, Requirement Refinement, Technical Discovery, Implementation Handoff, Implementation Report, and Post-Implementation Learning.
- Pragmatic architecture visualization support, likely C4, ArchiMate, or a lighter alternative.

## Detailed Requirement Files
- Template: `requirements/_template.md`
- `B3` Agent-Agnostic Dist Audit: `requirements/b3-agent-agnostic-dist-audit.md`
- `B4` Symlink-Based Install Mode: `requirements/b4-symlink-install-mode.md`
- `B8` High-Level Workflow Layer: `requirements/b8-high-level-workflow-layer.md`

## Acceptance Checks
- A reader can tell what is runtime output, source knowledge, and project planning.
- Every new runtime rule has a clear reason in `principles/` or an explicit planning decision.
- Every new skill has a likely real trigger and a clear job.
- Runtime guidance gets shorter or more useful over time, not larger by default.
