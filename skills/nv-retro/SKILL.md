---
name: nv-retro
description: Critique a just-completed agent task or session transcript for wasted effort and user corrections, and propose one durable instruction change. Use after a planning or implementation run, or when asked whether a session was efficient.
---

## Scope

- Default target is the task just completed in this session. A supplied transcript or session log can be analyzed instead; reconstruct its reads, searches, commands, and results from the tool entries.
- This is a critique, not a defense of the work. It is read-only: return the result in chat and do not edit instruction files, skills, or docs unless requested.
- State cost or token figures only when the user or a usage export provides them; never estimate them as fact. Treat a single run as a noisy sample and frame findings as patterns.

## Approach

1. Tally the expensive moves: sub-agent or parallel fan-outs, full reads of large files, repeated searches, build and test re-runs, fix cycles.
2. Judge each against whether it was needed for the output. Name the cheaper replacement for avoidable work, such as a targeted search, a slice of the relevant definition, or a fact already known.
3. Find loops and backtracks: write-then-rework, late rename cascades, commands run from the wrong directory, and serial rounds that one batched query would have answered.
4. List user corrections: what the agent did first, how the user redirected, and what instruction would have prevented it. These are the strongest signal.
5. Identify the missing upfront context whose presence at the start would have removed the most rounds, such as a call-site inventory, an API shape, or a pre-decided type.

## Where the rule belongs

- Point the proposed change at its most stable home and check that it does not already exist there. Typical homes: personal agent defaults, project agent instructions (`AGENTS.md`, `CLAUDE.md`), project convention or task-preflight docs, or the skill that drove the run.
- Prefer a structural change (how work is split, when to fan out, what to decide before writing) over a written rule when both would work. Structural changes hold across runs; rules mostly reduce detail-level variance.

## Output

- **Cost drivers**: biggest first.
- **Avoidable work**: each item with its cheaper replacement.
- **User corrections**: each with the instruction that would have prevented it.
- **Better upfront context**: what should have been known or decided at the start.
- **Better phase split**: how planning and implementation, or the steps within them, should have been divided.
- **Rule to add**: one change, the highest-leverage one, with its target file.
- **Estimated saving**: low, medium, or high, with a one-line basis tied to the named drivers.

## Check

- Is it critical, with no justification of the work?
- Is every avoidable item paired with a concrete cheaper action?
- Does the rule name a real target, avoid duplicating an existing rule, and prefer a structural fix where one exists?
