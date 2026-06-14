---
name: new-component
description: Create new React/UI components within existing design system
triggers:
  - create component
  - new component
  - build UI element
  - add component
mcp_servers:
  - figma  # fetch design context when implementing from design specs
---

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
- One clear responsibility, small props API, minimal state?
- JSX readable; abstraction level matches project patterns?