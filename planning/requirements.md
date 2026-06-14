# Project Requirements

## Purpose
This repository is a personal AI-assisted software toolbox. It captures coding, architecture, product management, workflow, and agent-tooling principles from long-term professional practice, then compresses the runtime-relevant parts into agent guidance.

The primary deliverable remains the portable agent package in `dist/`.

## Requirements
- `dist/` must stay agent-agnostic and usable with Codex, Claude, Gemini, opencode, and similar markdown-reading coding agents where practical.
- `dist/AGENTS.md` and `dist/skills/**` must be concise enough for normal agent context use.
- `principles/` must remain repo-only source/rationale material and must not be installed by default.
- Traceability must flow from `principles/` to runtime outputs; runtime outputs must not carry source references that increase token cost.
- Skills must stay generic base skills unless a domain-specific boundary is explicitly introduced.
- The repo must support project-specific extension: users can derive local skills or project rules from these base skills.
- MCP/tooling guidance must be clear enough to extract or adapt without coupling every skill to every tool.
- The install model should support fast iteration, including a symlink mode if agent harnesses allow it.
- The project should evaluate non-native harnesses such as opencode before adding harness-specific assumptions.
- Skill naming must make origin clear enough in agent menus without sacrificing portability.
- A feedback or retro workflow should help turn real usage into improvements to this repo.
- A high-level workflow layer should cover Idea Brief, Requirement Refinement, Technical Discovery, Implementation Handoff, and Implementation Report.
- Architecture support should include a pragmatic path for C4, ArchiMate, or another visual planning/documentation method.
- Content must stay pragmatic: no unused ceremony, no broad fluff, no skills that do not map to real usage.

## Acceptance Checks
- A reader can tell what is runtime output, source knowledge, and project planning.
- Every new runtime rule has a clear reason in `principles/` or an explicit planning decision.
- Every new skill has a likely real trigger and a clear job.
- Runtime guidance gets shorter or more useful over time, not larger by default.

