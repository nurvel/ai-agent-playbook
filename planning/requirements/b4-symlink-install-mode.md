# B4: Symlink-Based Install Mode

## Goal
Design an install mode that can link global agent files back to this repo for faster iteration, while preserving the current copy-based install as a safe fallback unless a later decision changes that default.

## In Scope
- Evaluate current copy behavior in `scripts/install-playbook.sh`.
- Define a symlink mode for Codex and Claude targets already supported by the script.
- Identify what must be verified before adding Gemini or opencode support.
- Decide how dry-run, validation, existing files, and rollback should work.
- Produce an implementation plan before changing the installer.

## Out of Scope
- Implementing symlink support.
- Adding Gemini or opencode install support before their expected paths and file contracts are verified.
- Installing repo-local `principles/`, `planning/`, or `repo-skills/` by default.
- Replacing `dist/` with generated output.

## Requirements
- Copy-based install must remain available.
- Symlink mode must never delete unrelated files from agent directories.
- Existing destination files must be handled explicitly: overwrite, backup, skip, or fail with a clear message.
- Dry-run must show whether files would be copied, linked, skipped, or replaced.
- Validation must detect broken symlinks and missing skill directories.
- The installer must keep `dist/AGENTS.md` mapped to each agent's expected guide filename, such as `AGENTS.md` for Codex and `CLAUDE.md` for Claude.
- The design must document any agent-specific limitations before implementation.

## Acceptance Criteria
- The desired CLI shape is defined, including flags and defaults.
- Supported targets and unsupported targets are explicit.
- File conflict behavior is explicit.
- Validation behavior is explicit for both copy and symlink modes.
- The implementation plan can be executed without guessing install semantics.

