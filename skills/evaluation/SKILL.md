---
name: evaluation
description: Evaluate a target on a 0-10 scale, explain why, and state what raises it to the next level
triggers:
  - evaluate
  - score
  - rate quality
  - assess maturity
  - give rating
---

## When to use
- Evaluating the quality or maturity of code, architecture, docs, workflows, or repo setup
- Comparing the current state against a clear quality bar
- Giving a concise score with reasoning and next-step guidance

## Evaluation dimensions
- Correctness
- Clarity
- Consistency
- Maintainability
- Usability
- Completeness

Use only the dimensions that matter for the target. Do not force irrelevant criteria.

## Scoring guidance
- `0-2` — fundamentally broken, missing, or not usable
- `3-4` — major gaps or weak foundations
- `5-6` — usable, but inconsistent or incomplete
- `7-8` — strong overall, with some meaningful gaps
- `9` — very strong, only minor weaknesses remain
- `10` — exceptionally complete, coherent, and hard to materially improve

Prefer conservative scoring. Do not inflate scores without concrete evidence.

## Evaluation approach
- Define what is being evaluated before scoring it.
- Judge the target against explicit criteria, not general vibes.
- Ground the score in concrete observations.
- Separate current strengths from current limitations.
- State what blocks the next score level.
- State the smallest meaningful improvements that would raise the score.

## Output format
Prefer this structure unless asked otherwise:

1. **Score** — `X/10`
2. **Why this score** — concise rationale tied to evidence
3. **What blocks the next level** — the main gaps preventing `X+1`
4. **What would raise it** — concrete improvements needed for the next level
5. **Strengths** — optional, only if useful

## Check
- Is the target clearly defined?
- Is the score grounded in evidence?
- Are gaps and improvements concrete?
- Is scoring conservative?

## Constraints
- Do not give a score without explaining it.
- Do not use fake precision.
- Do not treat all criteria as equally important if they are not.
- Do not invent missing evidence; say when the basis is limited.

## Cross-reference
- Apply all defaults from `AGENTS.md`.
