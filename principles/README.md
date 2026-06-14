# Principles

This directory is the repo-only knowledge layer behind the Agent Engineering Playbook.

Use it for durable principles, lessons, tradeoffs, and taste around coding, architecture, product management, workflows, and agent tooling. This material explains why the runtime guidance exists.

`principles/` is not installed into agent environments. The deployable output remains `dist/AGENTS.md` and `dist/skills/**`.

## Compression Model

Principles can be detailed. Runtime guidance must be compressed.

- A principle page may contain rationale, examples, caveats, and tradeoffs.
- A skill should contain only the smallest useful instruction the agent needs at execution time.
- Traceability flows one way: principle pages can list which runtime outputs they inform, but runtime outputs should not reference principle pages.

## Starter Areas

- `coding.md` - coding quality, simplicity, maintainability, tests
- `architecture.md` - system structure, boundaries, documentation, visualization
- `product-management.md` - discovery, requirements, prioritization, delivery
- `agent-tooling.md` - agent behavior, harness compatibility, install model, MCP/tooling
- `workflows.md` - high-level workflow stages and expected handoffs
