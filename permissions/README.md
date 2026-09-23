# Permissions

Personal permission policy, maintained directly in each harness's native format. Like the rest of this repository, these files are a catalogue: merge the relevant parts into a machine's or project's configuration instead of replacing it.

## Configurations

| Harness | Files | Target |
|---|---|---|
| Claude Code | [claude/settings.json](claude/settings.json) | `permissions` in `~/.claude/settings.json` or project `.claude/settings.json` |
| Codex | [codex/config.toml](codex/config.toml), [codex/default.rules](codex/default.rules) | Keys in `~/.codex/config.toml`; rules in `~/.codex/rules/` |

## Shared policy

- Local reading, searching, and read-only Git and GitHub CLI inspection run without prompts.
- Recursive deletes, pushes, remote changes, publishing, cloud and cluster CLIs, SSH, and network transfers require approval.
- Force pushes and forced recursive deletes are blocked.
- Other commands follow the harness's default mode instead of a blanket approval gate.

## Harness differences

- Claude Code gates `.env` reads with `Read` rules, which also cover recognized shell readers such as `cat`. Codex has no equivalent rule; its sandbox can read the workspace.
- Codex runs commands in a workspace-write sandbox without network access, so network-dependent commands escalate for approval even without a matching rule.
- Codex applies the strictest matching rule and Claude Code applies deny before ask before allow. A broad prompt rule such as `gh` therefore overrides narrower allow rules; list mutating commands explicitly or leave them to the default mode.
- Both match command prefixes. A flag after positional arguments, such as `git push origin --force`, bypasses the block and falls back to the push approval rule.

## Changing the policy

- Update every harness file affected by a shared decision, and record intentional differences above.
- Validate changes with the harness's own checks, such as `codex execpolicy check --rules codex/default.rules -- git push --force`.
