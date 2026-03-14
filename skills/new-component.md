## When to use
- Creating new React components
- Building new UI units in existing design system / app structure

## Goals
- One clear responsibility per component
- Small, understandable props API
- Easy to read render logic
- Minimal state
- Good fit with existing architecture and styling conventions

## Build guidance
- Start specific, not overly generic.
- Keep props minimal and explicit.
- Derive values instead of duplicating state.
- Move complex logic out of JSX when helpful.
- Split into subcomponents only when it improves readability, testing, or reuse.
- Avoid feature flags and config branches without real need.
- Avoid creating a “universal” component too early.
- Keep accessibility and responsive behavior as baseline quality.

## Check
- Is responsibility clear?
- Is props API small?
- Is naming clear?
- Is state minimal?
- Is JSX readable?
- Is abstraction level appropriate?
- Does it match project patterns?

## Cross-reference
- Apply all defaults from `AGENTS.md`.