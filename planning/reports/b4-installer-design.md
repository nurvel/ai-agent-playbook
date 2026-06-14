# B4 Installer Design

## Summary
Add modular installer support to `scripts/install-playbook.sh` with independent target modules and independent install methods.

The design has two separate axes:
- Target module: Codex, Claude, or all supported targets.
- Install method: copy or symlink.

Recommended direction:
- Keep copy method available and backward-compatible.
- Add link method as a separate implementation path, not as a wrapper around copy.
- Keep Codex and Claude as the only supported targets for now.
- Keep "all supported targets" available as an explicit option and as the default when no target is selected.
- Link individual guide files and individual skill directories.
- Never replace the whole destination `skills/` directory.
- Fail on symlink conflicts by default.
- Allow explicit backup-and-replace behavior with `--conflict backup`.

## Current Behavior
The installer currently:
- Computes `package_root` as this repo's `dist/`.
- Supports Codex via `~/.agents`.
- Supports Claude via `~/.claude`.
- Defaults to both targets when no target flag is provided.
- Supports `--codex`, `--claude`, and `--dry-run`.
- Copies `dist/AGENTS.md` to:
  - `~/.agents/AGENTS.md`
  - `~/.claude/CLAUDE.md`
- Copies `dist/skills/*` into:
  - `~/.agents/skills/*`
  - `~/.claude/skills/*`
- Uses `rsync -a`; dry-run adds `-n -v`.
- Creates destination directories as needed.
- Validates guide file existence and non-empty skills directory after non-dry-run installs.

The current copy behavior is intentionally non-destructive toward unrelated files because it does not delete extra files in destination agent directories.

## Architecture Design
Split the installer into target modules and install method modules.

Target modules:
- Own agent-specific file mappings.
- Know target root, guide destination, and skills destination.
- Do not know whether files are copied or linked.
- Can be updated independently when an agent changes its expected paths.

Install method modules:
- Own how sources are installed to destinations.
- Support copy and link as independent methods.
- Do not know Codex-specific or Claude-specific paths.
- Consume a target module's desired file mapping and execute or dry-run operations.

Orchestration:
1. Parse selected targets.
2. Parse selected install method.
3. Build install plans from target modules.
4. Execute the selected method against each target plan.
5. Validate each target with method-aware validation.

This keeps Codex and Claude path changes separate from copy/link behavior, and keeps copy/link behavior reusable for future targets.

## CLI Design
Keep the existing CLI valid:

```bash
scripts/install-playbook.sh
scripts/install-playbook.sh --codex
scripts/install-playbook.sh --claude
scripts/install-playbook.sh --codex --claude
scripts/install-playbook.sh --dry-run
```

Add:

```bash
scripts/install-playbook.sh --all
scripts/install-playbook.sh --method copy
scripts/install-playbook.sh --method link
scripts/install-playbook.sh --method link --conflict fail
scripts/install-playbook.sh --method link --conflict backup
scripts/install-playbook.sh --codex --method link
scripts/install-playbook.sh --claude --method link
scripts/install-playbook.sh --all --method link
```

Flags:
- `--all`: install all supported target modules. This is also the default when no target is selected.
- `--codex`: include the Codex target module.
- `--claude`: include the Claude target module.
- `--method copy`: use the copy install method.
- `--method link`: use the symlink install method.
- `--conflict fail`: default for link mode; stop before replacing an existing non-matching destination.
- `--conflict backup`: move conflicting destination paths aside with a timestamped suffix, then create the symlink.

Backward-compatible aliases:
- Existing no-method usage keeps copy behavior.
- Optional shorthand `--link` may map to `--method link`, but the implementation should keep `--method copy|link` as the primary internal model.

Rejected for now:
- `--overwrite`: too easy to destroy user-managed files. Backup is safer and still practical.
- `--unlink`: useful later, but out of scope for first symlink implementation.

## Target Modules

| Target | Guide destination | Skills destination | Supported now |
| --- | --- | --- | --- |
| Codex | `~/.agents/AGENTS.md` | `~/.agents/skills/<skill>` | Yes |
| Claude | `~/.claude/CLAUDE.md` | `~/.claude/skills/<skill>` | Yes |
| Gemini | Unknown | Unknown | No |
| opencode | Unknown | Unknown | No |

For Codex and Claude, symlink sources should stay in `dist/`:
- Guide source: `dist/AGENTS.md`
- Skill source: `dist/skills/<skill>`

The guide source is the same file for both agents, even though the destination filename differs.

Target module contract:
- `id`: stable target id, such as `codex` or `claude`.
- `label`: user-facing label.
- `root`: user-level destination root.
- `guide_destination`: full guide path.
- `skills_destination`: full skills directory.
- `guide_source`: usually `dist/AGENTS.md`.
- `skill_sources`: `dist/skills/<skill>` entries.
- `validate_capabilities`: target-specific validation notes if needed.

`all` is not a target module. It is a selector that expands to every supported target module.

## Install Method Modules

Copy method:
- Current install behavior.
- Uses copy/sync semantics.
- Overwrites managed guide and matching skill paths.
- Leaves unrelated destination files alone.
- Does not call or depend on link method.

Link method:
- New install behavior.
- Uses symlink semantics.
- Links guide file and individual skill directories.
- Has explicit conflict handling.
- Does not call or depend on copy method.

Both methods consume the same target module plan. Adding a new target should not require changing either method unless that target has unique validation constraints.

## Link Method Behavior
For each selected target:
1. Ensure the target root exists.
2. Ensure the target `skills/` directory exists as a real directory.
3. Link the guide file:
   - `dist/AGENTS.md` -> target guide path.
4. Link each skill directory:
   - `dist/skills/<skill>` -> target `skills/<skill>`.

Important constraint:
- Do not symlink the entire destination `skills/` directory to `dist/skills/`.

Reason:
- Replacing the destination `skills/` directory would hide or displace unrelated user skills.
- Linking individual skill directories preserves the current non-destructive install contract.

## Conflict Behavior
Copy method:
- Preserve current behavior.
- Existing guide files and matching skill paths are overwritten by `rsync`.
- Extra unrelated files remain untouched.

Link method with default `--conflict fail`:
- Missing destination: create symlink.
- Existing symlink to the expected source: leave as-is and report `skip`.
- Existing file, directory, symlink to another source, or broken symlink: fail with a clear message before changing that path.

Link method with `--conflict backup`:
- Missing destination: create symlink.
- Existing symlink to expected source: leave as-is and report `skip`.
- Existing conflicting path: move it to a timestamped backup name in the same directory, then create the symlink.
- Example backup suffix: `.backup-YYYYMMDD-HHMMSS`.

Do not add raw overwrite behavior in the first implementation. If a user wants replacement, `--conflict backup` gives a recoverable path.

## Dry-Run Behavior
Dry-run must print the planned operation for every managed path:
- `mkdir`: destination directory would be created.
- `copy`: source would be copied to destination.
- `link`: symlink would be created.
- `skip`: destination already matches desired state.
- `backup`: destination would be moved aside.
- `conflict`: destination blocks install under current conflict policy.

Dry-run must not create directories, copy files, move backups, or create symlinks.

For link method, dry-run should still inspect destination paths so it can report conflicts accurately.

## Validation Behavior
Shared validation:
- `dist/AGENTS.md` exists.
- `dist/skills/` exists.
- `dist/skills/` contains at least one skill directory.
- Selected target roots exist after non-dry-run install.

Copy method validation:
- Guide destination exists and is a regular file or symlink-resolved file.
- Destination `skills/` directory exists.
- Destination `skills/` contains at least the expected installed skill names from `dist/skills/`.

Link method validation:
- Guide destination is a symlink.
- Guide symlink resolves to `dist/AGENTS.md`.
- Destination `skills/` directory exists and is not itself a symlink to `dist/skills/`.
- Each expected destination skill path is a symlink.
- Each skill symlink resolves to the matching `dist/skills/<skill>` directory.
- Broken symlinks fail validation.

Dry-run validation:
- Print what would be validated, but do not require destination paths to exist.

## Rollback Behavior
Copy method:
- Preserve current behavior; no rollback is added in B4 implementation.

Link method:
- Preflight conflicts for all selected targets before making changes when `--conflict fail` is used.
- In `--conflict backup` mode, keep an in-memory operation journal:
  - symlinks created
  - paths backed up
  - backup destination paths
- If the install fails after changes begin:
  - remove symlinks created during the failed run
  - restore backed-up paths when possible
  - report any rollback failure clearly

The implementation should still prefer preflight checks over relying on rollback.

## Unsupported Target Verification
Before adding Gemini, opencode, or another target, verify:
- Expected guide filename and directory.
- Expected skills directory, if any.
- Whether that agent reads skill folders from markdown files.
- Whether YAML frontmatter is consumed or just displayed as text.
- Whether symlinks are followed by the agent runtime.
- Whether user-level configuration has security restrictions around symlinks.
- Whether install should target user-level config, project-level config, or both.
- Whether that agent has different naming or metadata expectations.

Do not add target flags until these file contracts are known.

## Implementation Plan
1. Add parser state:
   - selected targets: empty means all supported targets
   - `install_method=copy`
   - `conflict_mode=fail`
2. Add target selection:
   - `--all`
   - `--codex`
   - `--claude`
3. Add method selection:
   - `--method copy`
   - `--method link`
   - optional shorthand `--link` as an alias for `--method link`
4. Add `--conflict <fail|backup>` parsing.
5. Reject invalid flag combinations:
   - unknown conflict mode
   - unknown method
   - `--all` combined with a specific target, unless treated as a no-op duplicate
   - `--conflict` with `--method copy`, unless it uses the default
6. Extract target modules:
   - Codex module
   - Claude module
   - all selector that expands to supported modules
7. Extract install method modules:
   - copy method
   - link method
8. Keep existing copy behavior available through the copy method.
9. Add link helpers:
   - resolve source and destination paths
   - classify destination state
   - plan operation
   - execute operation
10. Add dry-run output for both methods.
11. Strengthen validation:
   - expected skill names from `dist/skills`
   - copy-method destination presence
   - link-method symlink targets
12. Update README install examples.
13. Run validation checks.

## Validation Plan For Implementation
After installer implementation, run:

```bash
bash -n scripts/install-playbook.sh
scripts/install-playbook.sh --dry-run --codex
scripts/install-playbook.sh --dry-run --claude
scripts/install-playbook.sh --dry-run --all --method copy
scripts/install-playbook.sh --dry-run --all --method link
scripts/install-playbook.sh --dry-run --codex --method link
scripts/install-playbook.sh --dry-run --claude --method link
scripts/install-playbook.sh --dry-run --codex --claude --method link
scripts/install-playbook.sh --dry-run --all --method link --conflict backup
```

Also test at least one temporary target root in a shell-level harness before running against real home directories. The current script does not support target-root overrides, so the implementation should either:
- add an internal test seam for temporary roots, or
- validate manually in a temporary `HOME` when testing.

## Backlog Impact
B4 moved to Done with this report as the design artifact.

Added a follow-up implementation item so the design is not lost:
- `B14` Implement symlink-based install mode.

Keep `B10` separate because non-native harness verification is broader than symlink mode and should not block Codex/Claude symlink design.

## Acceptance Mapping

| Requirement | Design answer |
| --- | --- |
| CLI shape defined | Keep existing flags; add `--all`, `--method copy|link`, and `--conflict fail|backup`. |
| Supported targets explicit | Codex and Claude supported; Gemini/opencode unsupported until verified. |
| File conflict behavior explicit | Copy method preserves current overwrite behavior; link method fails by default and supports backup. |
| Dry-run behavior explicit | Print mkdir/copy/link/skip/backup/conflict operations without changes. |
| Validation behavior explicit | Separate copy and link validation rules, including broken symlink detection. |
| Install mapping preserved | `dist/AGENTS.md` maps to `AGENTS.md` for Codex and `CLAUDE.md` for Claude. |
| No unrelated deletion | Link individual skill dirs; never replace whole destination `skills/` directory. |
| Modular targets | Codex and Claude are separate target modules; `--all` expands to supported modules. |
| Independent methods | Copy and link are separate install method modules that consume the same target plans. |

## Open Questions
- Should implementation add a hidden test-root override to make installer tests safer?
- Should a future uninstall or relink command be added after symlink mode proves useful?
