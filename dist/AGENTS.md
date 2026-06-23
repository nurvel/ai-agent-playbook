
## Purpose and priorities
- Produce correct, simple, maintainable code.
- Correctness > clarity > simplicity > maintainability > readability > micro-optimisation.
- Fit existing architecture and conventions unless there is a strong reason not to.
- Prefer consistency over novelty.
- Prefer clarity over cleverness.

## Communication
- Be extremely concise.
- Sacrifice grammar for concision if needed.
- Do not flatter.
- Do not compliment unless explicitly asked for judgment.
- Assume more detail will be requested separately.
- If intent is unclear, ask instead of guessing.
- If ambiguity is minor, state assumptions and proceed.
- Challenge assumptions when the direction is flawed or risky.
- Flag flaws, inconsistencies, or better alternatives when they materially matter.
- Prefer correctness over agreement.

## Task execution
- Pick one lead skill from `skills/nurvel-<name>/SKILL.md` based on its purpose and `triggers`.
- Combine other skills only when they add clear value.
- Typical lead skills:
  - `nurvel-product-discovery` - deciding what should be built and why
  - `nurvel-requirements-definition` - turning a validated idea into clear scope and acceptance criteria
  - `nurvel-roadmap-planning` - sequencing initiatives into milestones
  - `nurvel-backlog-management` - maintaining priorities, statuses, and next work
  - `nurvel-story-slicing` - breaking defined work into implementation-ready stories
  - `nurvel-planning` - non-trivial tasks where the approach is unclear
  - `nurvel-bugfix`, `nurvel-new-component`, `nurvel-api-integration`, `nurvel-refactor`, `nurvel-test-writing`, `nurvel-code-review`, `nurvel-evaluation`
- Default flow:
  - select the lead skill
  - for product work, run PO skills before implementation skills
  - use `nurvel-planning` only when the task is non-trivial or the approach is unclear
  - implement using the selected skill guidance
  - use `nurvel-test-writing` when behavior should be protected from regression
  - use `nurvel-code-review` when the change is large, risky, or touches shared code
  - validate before considering the work complete
- If the repo has its own OpenSpec skills or conventions, treat them as primary for OpenSpec artifacts.
- Treat project-specific or domain-specific skills as primary for local conventions; use these `nurvel-*` skills as generic base guidance.
- Keep derived or local extension skills outside this base package unless the generic base behavior itself should change.
- Treat any given plan as the default path, not unquestionable truth.
- Explain briefly when deviating from the plan.
- Produce the smallest correct change that fits the codebase.
- Keep changes local and reviewable.
- Handle small adjacent changes (backend, API, schema) only when clearly part of the same task.

## Workflow blueprints
- Use chat-only output for small, immediate work the same agent can safely finish.
- Use repo-backed blueprint files when work is long-lived, handed off, product-ambiguous, risky, or needs auditability.
- Prefer the target project's existing source of truth for files; do not assume a `planning/` folder by default.
- Early phases capture durable decisions, constraints, and unknowns. Do not add concrete implementation steps before `implementation-handoff.md`.
- When a workflow phase is requested, the owner skill must produce the named artifact shape:
  - Idea Brief -> `idea-brief.md` owned by `nurvel-product-discovery`
  - Requirement Refinement -> `requirements-blueprint.md` or `product-spec.md` owned by `nurvel-requirements-definition`
  - Technical Discovery -> `technical-blueprint.md` owned by `nurvel-planning`, reviewed with `nurvel-code-review` when useful
  - Implementation Handoff -> `implementation-handoff.md` owned by `nurvel-planning`, with `nurvel-story-slicing` and `nurvel-test-writing` as support
  - Implementation Report -> `implementation-report.md` owned by `nurvel-code-review`, with `nurvel-backlog-management` for follow-up state
  - Post-Implementation Learning -> `post-implementation-learning.md`; use `nurvel-backlog-management` only when learning changes follow-up work
- Refresh technical and handoff artifacts when code, branch, scope, dependencies, or architecture changed since inspection.

## Simplicity and structure
- Prefer the simplest solution that solves the real problem.
- Avoid complexity without clear payoff.
- Place each logic part in its proper layer.
- UI should focus on rendering and interaction.
- Business and domain logic should be isolated from presentation details.
- Data access / API layers should stay thin.
- Shared utilities should stay focused and not become dumping grounds.
- Keep module and component APIs small and explicit.
- Prefer composition over complicated configuration.
- Avoid leaky abstractions.
- Prefer pure functions when possible.
- Prefer extracted functions with clear names over inline complexity.
- Keep trivial logic inline when extraction hurts readability.
- Prefer deterministic, testable units.
- Build reusable solutions only with real evidence of reuse.
- Avoid premature generalisation and just-in-case structure.
- Do not introduce factories, middleware, or indirection layers without concrete need.
- Remove dead code.
- Do not leave obsolete branches, wrappers, or unused helpers.

## React / UI defaults
- One component should have one clear responsibility.
- Split components when it improves readability, testing, or reuse.
- Do not split purely for cosmetic reasons.
- Keep render logic easy to scan.
- Move complex derivation or branching out of JSX when helpful.
- Keep props minimal and understandable.
- Prefer explicit props over highly generic prop systems.
- Avoid bloated configuration surfaces.
- Avoid harmful prop drilling.
- Do not introduce context without reason.
- Keep state minimal.
- Derive values instead of duplicating state where possible.
- Use local state unless broader scope is clearly needed.
- Keep async/data state predictable.
- Accessibility and responsive behavior are baseline quality.

## TypeScript defaults
- Prefer explicit, understandable types.
- Keep domain types and UI/view-model types distinct when useful.
- Avoid `any` unless there is a strong reason.
- Avoid overly complex generics.
- Avoid type-level cleverness that harms readability.

## Comments and docs defaults
- Prefer self-documenting code over excessive comments.
- Comment only when intent is not obvious.
- Comment when caveats or gotchas cannot be removed through code design.
- TODO comments are OK for clearly out-of-scope follow-up work.
- Do not use comments to compensate for poor structure.
- Keep comments accurate, minimal, and updated.

## MCP usage
- If a skill lists `mcp_servers` in frontmatter, treat it as a hint, not a hard requirement.
- Use the MCP server when it adds information the codebase alone cannot provide.
- Skip it when local code and existing context are sufficient.
- Typical uses:
  - `chrome-devtools` for browser debugging and runtime inspection
  - `figma` for design context and asset extraction
  - `context7` for current library and framework documentation

## Product work defaults
- Clarify the problem before locking the solution.
- Separate confirmed facts, assumptions, and decisions.
- Make user value, business value, and tradeoffs explicit.
- When `openspec/` exists, treat `openspec/specs/` as the source of truth for agreed behavior.
- When `openspec/` exists, treat `openspec/changes/` as the source of truth for active change plans.
- Keep roadmap work strategic; do not collapse it into task lists.
- Keep backlog state current: done, next, blocked, later, or dropped.
- Make prioritization and sequencing rationale explicit.

## Git defaults
- Use read-only git commands unless explicitly instructed otherwise.
- Editing files is allowed when needed for the task.
- Commits, pushes, rebases, and other state-changing git operations require explicit instruction.
- Break work into commit-sized logical units when practical.
- After completing a logical unit, proactively suggest a commit message that matches the scope.
- Keep commits atomic: one logical change per commit.
- Split unrelated concerns into separate commits.
- Simple changes: one-line commit message only.
- Complex changes: add a body explaining what changed and why.
- Wrap commit body lines at ~72 chars when practical.

## Quality gates
- Ensure the implementation is internally consistent.
- Ensure types, imports, and dependencies remain coherent.
- Ensure the solution fits the existing codebase style and architecture.
- Ensure abstraction is justified and readability did not regress.
- Ensure no dead code or leftovers remain.
- Ensure scope matches intent.
- Run relevant checks: TypeScript, linting, relevant tests.
- If a check cannot be run, say so briefly instead of pretending it passed.
- If validation fails because of your change, iterate immediately when the fix stays within scope.

## Default review lens
- Is the solution correct?
- Is it the simplest reasonable solution?
- Is the code easy for humans to read?
- Are responsibilities clearly separated?
- Does it fit the project architecture?
- Is abstraction justified?
- Is TypeScript helping rather than hurting?
- Is the API surface small and clear?
- Is the code easy to test and change?
- Is there dead code, accidental complexity, or just-in-case design?
