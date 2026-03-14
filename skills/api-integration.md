---
name: api-integration
description: Add API calls, wire server data to UI, manage fetch flows
triggers:
  - add API call
  - integrate API
  - wire data
  - fetch data
  - connect endpoint
mcp_servers:
  - context7  # look up library/framework documentation for data fetching patterns
---

## When to use
- Adding new API calls
- Wiring server data to UI
- Changing query / fetch flows
- Adding orchestration across multiple calls

## Goals
- Thin API layer
- Predictable data flow
- Clear separation between fetching, transformation, and presentation
- Stable and maintainable integration

## Guidance
- Keep API/client layer focused on transport and mapping.
- Do not hide large amounts of business logic in the API layer.
- Keep query / fetch responsibilities clear.
- Separate raw server data, domain logic, and UI-ready data when useful.
- If multiple calls are orchestrated together, make orchestration explicit.
- Extract multi-step data composition into clearly named functions when complexity grows.
- Keep cache strategy and data shape intentional.
- Avoid unclear dependencies and hidden coupling.

## Check
- Is data fetching in right place?
- Is business logic in right place?
- Is UI receiving usable data shape?
- Is orchestration understandable?
- Are boundaries clear?
- Are query keys / fetch triggers predictable?
- Is complexity justified?

## Cross-reference
- Apply all defaults from `AGENTS.md`.