
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
- Use relevant skills available in the current environment when their descriptions match the task and they add useful guidance.
- Combine skills only when they add clear value.
- Available task guidance:
  - `nurvel-product-planning` - a feature's problem, scope, requirements, and story slices
  - `nurvel-technical-planning` - technical discovery, implementation approach, and handoff
  - `nurvel-roadmap` - priorities, milestones, and backlog state across initiatives
  - `nurvel-bugfix` - diagnosis and minimal fixes for incorrect behavior
  - `nurvel-refactor` - structural improvements that preserve behavior
  - `nurvel-review` - read-only assessment of code or other content, with scoring when requested
- Ordinary implementation, component work, API integration, and test writing can follow the defaults below without a dedicated skill.
- Use only the planning, implementation, or review stages needed for the request. Validate changes before considering the work complete.
- Treat project-specific or domain-specific skills as primary for local conventions; use these `nurvel-*` skills as generic base guidance.
- Keep derived or local extension skills outside this base package unless the generic base behavior itself should change.
- Treat any given plan as the default path, not unquestionable truth.
- Explain briefly when deviating from the plan.
- Produce the smallest correct change that fits the codebase.
- Keep changes local and reviewable.
- Handle small adjacent changes (backend, API, schema) only when clearly part of the same task.

## Plans and artifacts
- Return analysis and plans in chat unless a file update is requested.
- Use the target project's existing source of truth and artifact conventions, including its own OpenSpec guidance when applicable.
- Named blueprint and report templates are optional references in the relevant skills. Load only the template needed for the requested output.
- Keep discovery, requirements, implementation steps, and portfolio priorities distinct without requiring a fixed sequence of documents.
- Refresh plans and handoffs when code, branch, scope, dependencies, or architecture have changed since inspection.

## Simplicity and structure
- Prefer the simplest solution that solves the real problem.
- Avoid complexity without clear payoff.
- Place each logic part in its proper layer.
- UI should focus on rendering and interaction.
- Business and domain logic should be isolated from presentation details.
- Data access / API layers should stay thin.
- Keep fetching, domain logic, and UI data shaping distinct where useful. Make multi-call orchestration, query keys, fetch triggers, and cache behavior explicit.
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
- Use available tools when they add information the codebase and existing context cannot provide.
- Useful cases include browser runtime inspection, design context, and current library documentation. Choose tools available in the current harness; a specific server is not required by these skills.

## Product work defaults
- Clarify the problem before locking the solution.
- Separate confirmed facts, assumptions, and decisions.
- Make user value, business value, and tradeoffs explicit.
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

## Testing defaults
- Test important behavior, critical transformations, and realistic edge cases at the simplest useful level.
- Prefer deterministic tests of observable behavior over tests tied to internal structure or coverage numbers.
- Test domain logic without unnecessary UI coupling; use integration or browser checks when acceptance depends on those layers.
- Add or update regression tests where they meaningfully protect changed behavior. Keep verification proportional to the change.
- Report what checks establish and what remains unverified.

## Default review lens
- Review code, content, plans, or configurations against their purpose, audience, and stated requirements.
- Keep reviews read-only unless changes are requested.
- Prioritize correctness, scope fit, clarity, and meaningful evidence; adapt technical criteria to the target.
- Give concrete findings with locations, impact, and improvement direction. Distinguish issues from assumptions and verification gaps.
- Score only when requested.
