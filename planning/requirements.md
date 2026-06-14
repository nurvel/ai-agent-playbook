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
- High-level workflow layer: Idea Brief, Requirement Refinement, Technical Discovery, Implementation Handoff, Implementation Report.
- Pragmatic architecture visualization support, likely C4, ArchiMate, or a lighter alternative.

## B3: Agent-Agnostic Dist Audit

### Goal
Make the portable package in `dist/` usable as base guidance for multiple coding agents without unnecessary Codex, Claude, or harness-specific assumptions.

### In Scope
- Review `dist/AGENTS.md` and every `dist/skills/*/SKILL.md`.
- Classify findings as:
  - agent-neutral and keep
  - target-project guidance and keep
  - harness-specific but acceptable with clearer wording
  - harness-specific and should move out of `dist/`
- Check naming, triggers, MCP wording, OpenSpec wording, paths, and install assumptions.
- Produce a short audit report before editing runtime files.

### Out of Scope
- Renaming skills.
- Changing installer behavior.
- Creating new skills.
- Removing OpenSpec compatibility only because this repo is not using OpenSpec.

### Requirements
- The audit must preserve useful target-project compatibility guidance even when this repo does not use that tool.
- The audit must distinguish runtime-package concerns from repo-local maintenance concerns.
- Proposed edits must keep `dist/` concise and avoid adding rationale that belongs in `principles/`.
- Each proposed runtime edit must say which file it affects and why it improves agent-agnostic use.

### Acceptance Criteria
- A reviewer can see all agent-specific assumptions found in `dist/`.
- Each finding has a recommended action: keep, reword, move, split, or defer.
- No runtime files are changed until the audit recommendations are accepted.
- Follow-up backlog items are created or updated if the audit reveals larger decisions.

## B4: Symlink-Based Install Mode

### Goal
Design an install mode that can link global agent files back to this repo for faster iteration, while preserving the current copy-based install as a safe fallback unless a later decision changes that default.

### In Scope
- Evaluate current copy behavior in `scripts/install-playbook.sh`.
- Define a symlink mode for Codex and Claude targets already supported by the script.
- Identify what must be verified before adding Gemini or opencode support.
- Decide how dry-run, validation, existing files, and rollback should work.
- Produce an implementation plan before changing the installer.

### Out of Scope
- Implementing symlink support.
- Adding Gemini or opencode install support before their expected paths and file contracts are verified.
- Installing repo-local `principles/`, `planning/`, or `repo-skills/` by default.
- Replacing `dist/` with generated output.

### Requirements
- Copy-based install must remain available.
- Symlink mode must never delete unrelated files from agent directories.
- Existing destination files must be handled explicitly: overwrite, backup, skip, or fail with a clear message.
- Dry-run must show whether files would be copied, linked, skipped, or replaced.
- Validation must detect broken symlinks and missing skill directories.
- The installer must keep `dist/AGENTS.md` mapped to each agent's expected guide filename, such as `AGENTS.md` for Codex and `CLAUDE.md` for Claude.
- The design must document any agent-specific limitations before implementation.

### Acceptance Criteria
- The desired CLI shape is defined, including flags and defaults.
- Supported targets and unsupported targets are explicit.
- File conflict behavior is explicit.
- Validation behavior is explicit for both copy and symlink modes.
- The implementation plan can be executed without guessing install semantics.

## Acceptance Checks
- A reader can tell what is runtime output, source knowledge, and project planning.
- Every new runtime rule has a clear reason in `principles/` or an explicit planning decision.
- Every new skill has a likely real trigger and a clear job.
- Runtime guidance gets shorter or more useful over time, not larger by default.
