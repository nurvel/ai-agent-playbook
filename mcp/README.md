# MCP catalogue

[catalog.json](catalog.json) lists MCP servers in the Claude Code `mcpServers` format. It is a catalogue, not a ready-to-load file: pick the entries a machine or project needs, replace `${...}` placeholders, and add them in the harness's native format. For Codex, translate `command`, `args`, `env`, and `url` into `[mcp_servers.<name>]` in `~/.codex/config.toml`.

| Server | Harness | Prerequisites |
|---|---|---|
| `chrome-devtools` | Any | Node.js and Chrome |
| `context7` | Any | Node.js; `CONTEXT7_API_KEY` |
| `figma` | Any | OAuth sign-in on first use. Skip it where a Figma connector is already enabled, to avoid duplicate tools. |
| `codex` | Claude Code | Codex CLI installed and signed in. Lets Claude delegate to Codex; do not add it to Codex itself. |
| `gsc` | Any | Node.js; Google OAuth client secrets file (`GSC_OAUTH_SECRETS_FILE`); `GSC_SITE_URL` per project |

When applying an entry:

- Pin package versions instead of `@latest` or unversioned names; `npx -y` runs whatever version is current.
- Keep credentials in environment variables or the harness's secret storage, never in committed files.
