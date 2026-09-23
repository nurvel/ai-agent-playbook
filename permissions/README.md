# Permissions

Personal permission configurations for coding-agent harnesses. Maintain each configuration directly in its native format and keep shared permission decisions aligned across harnesses.

## Configurations

- [claude/settings.json](claude/settings.json) — Claude Code permissions.

Keep each harness's files in its own folder. Add configurations as needed and list them here. Storing a configuration here does not activate it in a harness.

## Keeping configurations aligned

- When changing a shared permission decision, review every harness configuration and update the equivalent rules where supported.
- Compare effective behavior: what is allowed, requires approval, or is denied. Account for command matching, permission modes, and filesystem or network scope.
- Document intentional differences or unsupported behavior here alongside the affected configuration.
- Validate changed files using the harness's own checks where available.
