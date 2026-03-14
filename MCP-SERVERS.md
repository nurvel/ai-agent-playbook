# MCP Servers

Available Model Context Protocol servers. Use these when a skill's `mcp_servers` field lists them, or when the task clearly benefits from their capabilities.

## chrome-devtools
**Command:** `npx chrome-devtools-mcp@latest`

Browser debugging and runtime inspection. Use for investigating UI bugs, checking console errors, inspecting network requests, taking screenshots, and running Lighthouse audits.

**Relevant skills:** bugfix

## figma
**URL:** `https://mcp.figma.com/mcp`

Design context and asset extraction from Figma. Use for fetching design specs, screenshots, component metadata, and design tokens when implementing UI from designs.

**Relevant skills:** new-component

## context7
**Command:** `npx -y @upstash/context7-mcp@latest`

Up-to-date documentation lookup for libraries and frameworks. Use for checking API signatures, configuration options, and usage patterns instead of relying on potentially outdated training data.

**Relevant skills:** api-integration, bugfix, new-component
