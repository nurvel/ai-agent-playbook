# MCP catalogue

This is the authoritative, harness-neutral catalogue of MCP servers used in the personal toolset. It describes what to configure, not a ready-to-load file for any harness.

Select only the servers needed on a machine or project. When generating native configuration, inspect the installed harness version and current official server documentation, resolve a current compatible release, and pin the exact package version in the active configuration. Never store credential values in this repository.

## `chrome-devtools`

- **Purpose:** Inspect and automate Chrome through the Chrome DevTools Protocol.
- **Transport:** Local stdio process.
- **Launch shape:** `npx -y chrome-devtools-mcp@<PINNED_VERSION>`.
- **Prerequisites:** Node.js and a compatible Chrome installation.
- **Authentication:** None for the MCP server. The selected Chrome profile may contain authenticated browser state.
- **Capabilities and risk:** Reads page content, console and network data, and can interact with pages. Treat access to an authenticated browser profile as access to the signed-in services visible in that profile.
- **Selection:** Opt in where browser inspection is required.

## `context7`

- **Purpose:** Retrieve current external library documentation.
- **Transport:** Local stdio process.
- **Launch shape:** `npx -y @upstash/context7-mcp@<PINNED_VERSION>`.
- **Prerequisites:** Node.js.
- **Authentication:** Pass `CONTEXT7_API_KEY` through the harness's environment or secret facility. Do not place the value in command arguments or committed configuration.
- **Capabilities and risk:** Sends documentation queries to an external service; no external mutation is expected.
- **Selection:** Opt in where live dependency documentation is useful.

## `figma`

- **Purpose:** Access Figma design context through Figma's official remote MCP endpoint.
- **Transport:** Streamable HTTP.
- **Endpoint:** `https://mcp.figma.com/mcp`.
- **Prerequisites:** OAuth sign-in on first use.
- **Capabilities and risk:** Authenticated access to the Figma resources and tools exposed to the signed-in account. Inspect the current tool list and approval behavior before enabling write-capable tools.
- **Selection:** Skip this entry where the harness already provides a Figma connector, to avoid duplicate tools.

## `codex`

- **Purpose:** Let another harness delegate coding work to the local Codex CLI.
- **Transport:** Local stdio process.
- **Launch shape:** `codex mcp-server`.
- **Prerequisites:** Codex CLI installed and signed in.
- **Authentication:** Uses the local Codex installation's authentication and configuration.
- **Capabilities and risk:** Delegated Codex sessions may inspect or modify files and run commands according to Codex's own sandbox, approval policy, and active instructions.
- **Selection:** For non-Codex harnesses only. Never add Codex as an MCP server to Codex itself.

## `gsc`

- **Purpose:** Read Google Search Console data for an explicitly selected property.
- **Transport:** Local stdio process.
- **Launch shape:** `npx -y suganthan-gsc-mcp@<PINNED_VERSION>`.
- **Prerequisites:** Node.js, a Google OAuth desktop-client secrets file, and access to the selected Search Console property.
- **Authentication and configuration:**
  - `GSC_AUTH_MODE=oauth`
  - `GSC_OAUTH_SECRETS_FILE` points to the local, uncommitted OAuth client file.
  - `GSC_SITE_URL` identifies the selected property.
  - `GSC_SCOPES=readonly` is the required baseline.
- **Existing-install migration:** Changing `GSC_SCOPES` does not necessarily narrow an OAuth token that was already granted broader scopes. Re-run the pinned package's current official setup with reauthentication and select the read-only scope. Verify that the replacement grant contains only the required read-only permission, without printing token values. Revoke the older broader grant through Google's account permissions when it is no longer needed.
- **Capabilities and risk:** Reads private Search Console data. The server may also expose submission tools such as URL, batch, or sitemap submission; those are outside the read-only baseline.
- **Selection:** Opt in per property. A write-capable scope and submission tools require a separate explicit decision and approval policy.

## Native configuration generation contract

When asked to configure a target harness from this catalogue:

1. Confirm the target harness, installed version, configuration scope, and selected server names.
2. Consult current official documentation for both the harness and each selected server. Do not rely on the example launch shapes alone.
3. Preserve each entry's transport, authentication boundary, harness restriction, risk notes, and least-privilege defaults.
4. Resolve and pin exact package versions in active configuration. Do not emit `@latest` unless the user explicitly requests floating versions.
5. When a selected scope is narrower than an existing authorization, require the server's documented reauthentication flow and verify the replacement grant without exposing credential values. A configuration change alone is not evidence that an existing token was narrowed.
6. Refer to secrets by environment-variable name or the harness's secret facility. Never request or copy secret values into generated output.
7. Inspect existing native configuration and propose a merge. Do not replace unrelated settings or duplicate an existing connector.
8. Explain any native lifecycle, approval, or tool-filter settings added by the target harness; they are not portable MCP properties.
9. Show the proposed configuration and validation commands before applying it. Applying it requires a separate explicit request.
10. After application, use the harness's current diagnostics to verify that each selected server loads and that unselected servers were not added.