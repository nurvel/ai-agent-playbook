# B8 Workflow Layer Design

## Summary
B8 remains valid after R4. The requirement already uses `nurvel-*` skill names and does not need a rewrite before implementation.

Accepted design:
- Use the six-phase workflow from the B8 requirement.
- Treat blueprints as optional phase output contracts, not mandatory process.
- Coordinate existing `nurvel-*` skills instead of adding phase-specific runtime skills.
- Keep full templates in planning/source material; put compact blueprint skeletons in the existing phase-owner skills.
- Implement runtime support with one short workflow section in `dist/AGENTS.md`, compact output contracts in existing skills, and README alignment.

## Phase Contracts
| Phase | Output | Required when | Recommended skills | Freshness rule | Acceptance check |
| --- | --- | --- | --- | --- | --- |
| Idea Brief | `idea-brief.md` | Idea is raw, ambiguous, or not ready for requirements. | `nurvel-product-discovery` | Durable until problem, stakeholder, value, or timing changes. | Problem, stakeholder, value, constraints, unknowns, and next question are explicit. |
| Requirement Refinement | `requirements-blueprint.md` or `product-spec.md` | Work changes behavior, UX, data rules, scope, or acceptance criteria. | `nurvel-requirements-definition` | Durable until scope or product decisions change. Recheck before handoff. | In/out scope, assumptions, non-goals, rules, and testable acceptance criteria are clear. |
| Technical Discovery | `technical-blueprint.md` | Implementation path, system shape, dependencies, or risk is not obvious. | `nurvel-planning`, `nurvel-code-review` | Must be refreshed when relevant code, dependencies, or architecture changed since inspection. | Current implementation, reusable patterns, constraints, risks, and recommended approach are grounded in inspected files. |
| Implementation Handoff | `implementation-handoff.md` | Work is handed to another agent/person, delayed, or non-trivial enough to need execution control. | `nurvel-planning`, `nurvel-story-slicing`, `nurvel-test-writing` | Generate close to implementation. Refresh if branch, scope, or technical discovery changed. | Scope, facts, contracts, ordered steps, tests, acceptance checks, and stop conditions are decision-complete. |
| Implementation Report | `implementation-report.md` | Planned non-trivial work is implemented or deviates from handoff. | `nurvel-code-review`, `nurvel-backlog-management` | Write immediately after implementation and validation. | Changes, decisions, tests run/not run, deviations, risks, and follow-up are explicit. |
| Post-Implementation Learning | `post-implementation-learning.md` | Work revealed repeatable rework, missing guidance, or skill/template improvements. | Future repo-local `skill-evolution` workflow | Capture while review and correction context is fresh. | The note says what should improve in requirements, discovery, handoff, skills, principles, or templates. |

## Artifact Policy
Blueprints are not required for every task.

Use chat-only outputs for small, immediate work where the same agent can safely proceed. Use repo-backed blueprint files when work is long-lived, handed between agents, has meaningful product ambiguity, or needs auditability.

Default target-project location:
- Prefer the project's existing source of truth: issue, PR description, docs folder, product tool, or OpenSpec change.
- If the project already uses product artifacts, use `product/initiatives/<slug>/` for multi-phase blueprint files.
- If only one durable artifact is needed, use the existing project convention such as `product/initiatives/<slug>.md` and embed or link the relevant blueprint section.
- Do not use this repo's `planning/` layout as a target-project default.

Early-phase artifacts must avoid brittle implementation steps. `implementation-handoff.md` is the first blueprint expected to contain concrete execution steps.

## Runtime Design
Do not create new runtime skills for B8. Existing `nurvel-*` skills own or support the phase behavior.

Runtime changes:
- Add a compact `Workflow blueprints` section to `dist/AGENTS.md`.
- Mention when blueprints are useful, when chat-only is enough, and that early phases should avoid execution steps.
- Include the phase order, artifact names, and skill mapping.
- Add compact workflow output skeletons to phase-owner skills:
  - `nurvel-product-discovery` owns `idea-brief.md`.
  - `nurvel-requirements-definition` owns `requirements-blueprint.md` and `product-spec.md`.
  - `nurvel-planning` owns `technical-blueprint.md` and `implementation-handoff.md`.
  - `nurvel-code-review` owns `implementation-report.md` when summarizing completed implementation.
- Clarify support roles:
  - `nurvel-story-slicing` feeds handoff scope, feature rules, and acceptance.
  - `nurvel-test-writing` feeds handoff test planning.
  - `nurvel-backlog-management` records follow-up after reports and learning.
  - `nurvel-roadmap-planning` uses workflow artifacts as input but is not a phase owner.
- Update README target-project artifact guidance to allow `product/initiatives/<slug>/` for multi-blueprint initiatives.
- Update `principles/workflows.md` distilled output after runtime edits land.

Do not add:
- A separate `dist/tools/` or workflow adapter layer.
- New phase-specific skills.
- Full template bodies to `dist/AGENTS.md` or a shared runtime template file.
- Installer changes.

## Validation Against B8 Acceptance
- Each phase has purpose, input/output shape, skill mapping, freshness rule, and acceptance check.
- Blueprint use is optional except where handoff, delay, risk, or ambiguity makes it valuable.
- Target-project storage is defined without coupling to this repo's `planning/` folder.
- Early-phase artifacts explicitly exclude implementation steps.
- Implementation Handoff is the execution-ready artifact.
- Implementation Report supports review, follow-up, and later learning.
- Runtime impact is limited to `dist/AGENTS.md`, existing `dist/skills/**`, README alignment, and workflow principle distilled-output updates.
- Runtime changes can stay concise and agent-agnostic.

## Implementation Handoff
When implementing the accepted B8 runtime changes:
1. Update `dist/AGENTS.md` with a short workflow-blueprints section near task execution.
2. Update phase-owner and support skills with compact workflow output contracts.
3. Update `README.md` target-project artifact guidance for multi-blueprint initiative folders.
4. Update `principles/workflows.md` distilled runtime outputs.
5. Update `planning/backlog.md` and `planning/roadmap.md` only after the runtime change is applied or deliberately deferred.
6. Validate with `git diff --check` and inspect active docs for stale unprefixed skill names or old artifact paths.
