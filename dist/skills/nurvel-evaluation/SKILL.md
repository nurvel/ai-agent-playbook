---
name: nurvel-evaluation
description: Evaluate a target on a 0-10 scale, explain why, and state concrete actions to reach each remaining level
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
- State what blocks each remaining level, not just the next one.
- For every level above the current score, list concrete, actionable improvements.
- Keep actions specific: name the file, module, behavior, or gap — not vague directions.
- Escalate difficulty across levels: each step should represent a real increase in maturity, not repetition of the previous one.

## Output format
Prefer this structure unless asked otherwise:

1. **Score** — `X/10`
2. **Why this score** — concise rationale tied to evidence
3. **Strengths** — optional, only if useful
4. **Path to higher levels** — one subsection per level above the current score. For a score of `X`, produce a subsection for `X+1`, `X+2`, … up to `10`.

For each level subsection, include:
- **What blocks this level** — the specific gaps preventing it
- **Concrete actions to reach it** — named, actionable improvements (files, modules, behaviors, tests, docs). Keep each action small enough to implement and verify.

Example shape when current score is `7`:

```
## Path to higher levels

### 8/10
- What blocks this level: ...
- Concrete actions:
  - ...
  - ...

### 9/10
- What blocks this level: ...
- Concrete actions:
  - ...

### 10/10
- What blocks this level: ...
- Concrete actions:
  - ...
```

If the current score is already `10`, omit this section and note that no further improvements are identified.

## Check
- Is the target clearly defined?
- Is the score grounded in evidence?
- Are gaps and improvements concrete?
- Is scoring conservative?
- Is there a subsection for every level between the current score and `10`?
- Do higher-level actions represent genuinely harder improvements, not repeats of lower-level ones?

## Constraints
- Do not give a score without explaining it.
- Do not use fake precision.
- Do not treat all criteria as equally important if they are not.
- Do not invent missing evidence; say when the basis is limited.
