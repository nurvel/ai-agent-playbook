# Workflow

How to select and chain skills for a given task. Always follow `AGENTS.md` as the baseline for all work.

## Skill selection

Match the task to a skill based on its `triggers` in the frontmatter. When multiple skills apply, use the primary task type to pick the lead skill and reference others as needed.

| Task type | Primary skill | Often combined with |
|---|---|---|
| Plan before implementing | `planning` | — |
| Fix a bug | `bugfix` | `test-writing` |
| Build new UI | `new-component` | `planning`, `test-writing` |
| Connect to API / data | `api-integration` | `test-writing` |
| Restructure code | `refactor` | `code-review`, `test-writing` |
| Write or update tests | `test-writing` | — |
| Review work | `code-review` | — |
| Evaluate quality or maturity | `evaluation` | `code-review`, `planning` |

## When to plan first

Use `planning` before implementation when:
- The task touches multiple layers or modules
- The approach is unclear or has multiple valid paths
- The change is large enough that a wrong direction wastes significant effort

Skip planning when:
- The task is a small, well-scoped bugfix or change
- The approach is obvious from the codebase
- The skill guidance alone provides sufficient direction

## Task flow

Every task follows the same core loop. Optional steps are added based on risk, size, and confidence.

1. **Select skill** — match task type to primary skill
2. **Plan** (optional) — use `planning` when the approach is unclear or the task is non-trivial
3. **Implement** — follow the selected skill's guidance
4. **Test** (optional) — use `test-writing` when the change affects behavior that should not regress
5. **Review** (optional) — use `code-review` when the change is large, risky, or touches shared code
6. **Validate** — always: type check, lint, tests pass, scope matches intent

## MCP server usage

Check the active skill's `mcp_servers` field. If a server is listed:
1. Determine if the task benefits from it (not every bugfix needs chrome-devtools)
2. Use it when it provides information you cannot get from the codebase alone
3. See `MCP-SERVERS.md` for server capabilities and commands

## Validation

Every task, regardless of skill, ends with:
- TypeScript check passes
- Linting passes
- Relevant tests pass
- Changes match intended scope
- No dead code or leftovers
