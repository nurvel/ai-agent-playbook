# Workflow Principles

## Summary
High-level workflows should make agent collaboration repeatable from idea to delivery without overloading every skill.

## Workflow Stages
- Idea Brief: clarify idea, problem, audience, value, and uncertainty.
- Requirement Refinement: turn validated direction into scope and acceptance criteria.
- Technical Discovery: inspect the codebase, constraints, dependencies, and implementation options.
- Implementation Handoff: produce a decision-complete plan or small story set.
- Implementation Report: summarize what changed, validation run, remaining risk, and follow-up.
- Post-Implementation Learning: capture what should improve in future requirements, discovery, handoffs, skills, or blueprint templates.

## Guidance
- Workflow stages coordinate skills; skills should remain focused and concise.
- Each stage should define inputs, output artifact, recommended skills, and acceptance check.
- Blueprint artifacts are optional; use chat-only output when work is small, immediate, and not handed off.
- Use repo-backed blueprint files when work is long-lived, ambiguous, risky, handed off, or needs auditability.
- Phase-owner skills should produce compact artifact skeletons when a workflow phase is requested.
- Early-stage artifacts should preserve durable decisions and uncertainty without pretending implementation details will remain stable months later.
- Implementation Handoff is the first stage expected to contain concrete execution steps.
- Support skills may feed blueprint sections, but they should not replace the phase-owner artifact.
- Workflow guidance belongs in a runtime-efficient form only when it changes agent behavior.

## Distilled Runtime Outputs
- `dist/AGENTS.md`: concise workflow-blueprint orchestration, phase artifacts, existing `nurvel-*` skill mapping, chat-vs-file guidance, and the rule that early phases avoid implementation steps.
- `dist/skills/**`: compact workflow output contracts in phase-owner skills and support-role clarification in helper skills.
- `README.md`: target-project artifact guidance, including `product/initiatives/<slug>/` for multi-blueprint initiatives.
