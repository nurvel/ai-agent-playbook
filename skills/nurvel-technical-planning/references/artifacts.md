# Technical artifacts

Use these shapes when the named output is requested and the project has no established template. Include relevant sections and state evidence gaps instead of filling them with guesses.

## Technical Discovery — `technical-discovery.md`

- Files inspected
- Current implementation
- Relevant patterns
- Existing utilities / components
- Constraints found
- Reuse opportunities
- Risks
- Recommended approach

Capture verified facts and technical choices. Detailed execution steps can wait until implementation planning is requested.

## Implementation Handoff — `implementation-handoff.md`

- Goal and what to report back
- Scope: create / modify / inspect only / out of scope
- Current facts
- Contracts
- Constraints: non-negotiables and feature rules
- Implementation steps
- Acceptance
- Test plan
- Stop conditions

Make steps executable in a useful order. Identify behavior to protect, checks that establish acceptance, and material unknowns that must be resolved before dependent work. Preserve the user's authorization boundaries in the handoff.

## Implementation Report — `implementation-report.md`

- Summary
- Files changed
- Key decisions
- Tests run
- Tests not run
- Deviations from plan
- Remaining risks and follow-up work

Base the report on the actual changes and available validation results. Keep observed results separate from claims supplied by an implementer. Do not infer successful browser, integration, or release verification from unit tests alone, and do not mark unfinished work complete to close a handoff.
