# B3: Agent-Agnostic Dist Audit

## Goal
Make the portable package in `dist/` usable as base guidance for multiple coding agents without unnecessary Codex, Claude, or harness-specific assumptions.

## In Scope
- Review `dist/AGENTS.md` and every `dist/skills/*/SKILL.md`.
- Classify findings as:
  - agent-neutral and keep
  - target-project guidance and keep
  - harness-specific but acceptable with clearer wording
  - harness-specific and should move out of `dist/`
- Check naming, triggers, MCP wording, OpenSpec wording, paths, and install assumptions.
- Produce a short audit report before editing runtime files.

## Out of Scope
- Renaming skills.
- Changing installer behavior.
- Creating new skills.
- Removing OpenSpec compatibility only because this repo is not using OpenSpec.

## Requirements
- The audit must preserve useful target-project compatibility guidance even when this repo does not use that tool.
- The audit must distinguish runtime-package concerns from repo-local maintenance concerns.
- Proposed edits must keep `dist/` concise and avoid adding rationale that belongs in `principles/`.
- Each proposed runtime edit must say which file it affects and why it improves agent-agnostic use.

## Acceptance Criteria
- A reviewer can see all agent-specific assumptions found in `dist/`.
- Each finding has a recommended action: keep, reword, move, split, or defer.
- No runtime files are changed until the audit recommendations are accepted.
- Follow-up backlog items are created or updated if the audit reveals larger decisions.

