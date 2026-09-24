---
name: nv-review
description: Review or evaluate code, written content, documentation, plans, skills, configurations, or processes. Use when asked to review, audit, assess, check, or score something; provides findings and optional scores.
---

## Scope

- Establish the target, intended purpose, audience, and requested depth from the available context. Use stated requirements or acceptance criteria as the quality bar.
- Review is read-only by default. Do not edit the reviewed material or change git state unless changes are requested. Creating a requested review report is allowed; it does not authorize fixing the target.
- Assess the actual content or implementation and relevant surrounding evidence. A completion claim or passing check alone does not establish that the result meets its purpose.

## Choose relevant criteria

| Target | Review focus |
|---|---|
| Code | Correctness, regressions, contracts, architecture, maintainability, and meaningful verification |
| Written content and documentation | Accuracy, clarity, structure, audience fit, consistency, and completeness |
| Plans and requirements | Problem fit, scope, feasibility, assumptions, dependencies, and testable acceptance |
| Skills and configurations | Clear instructions, appropriate activation, consistency, duplication, compatibility, and intended behavior |
| Processes | Purpose, responsibilities, handoffs, failure handling, and proportionate effort |

Apply only the criteria relevant to the request. A content review does not need code checks; a technical review should not become a general style rewrite.

## Review approach

- Prioritize correctness and fitness for purpose, then scope and structure, then clarity and smaller polish.
- Ground findings in specific evidence. Use file and line references for code, or a section, passage, or configuration key for other material.
- Explain the consequence and give a concrete improvement direction. Distinguish observed problems from assumptions and verification gaps.
- Keep recommendations proportional. Do not require unrelated refactors, extra process, or personal style preferences without a material benefit.
- Use checks that preserve the reviewed material. Report what was checked and any important limits; do not claim runtime or factual verification from inspection alone.

## Output

- Lead with the assessment, then findings ordered by impact. Distinguish must-fix issues, worthwhile improvements, and optional observations where useful.
- Each finding should identify the location, problem, impact, and suggested direction. Say when no material findings were identified; do not invent issues to fill categories.
- Provide a numeric rating only when requested. Read the [scoring guide](references/scoring.md) for scores or a requested path to higher levels.
