# Technical artifacts

Use these shapes when the named output is requested and the project has no established template. Return the artifact in chat unless writing a file is requested. Include relevant sections and state evidence gaps instead of filling them with guesses.

## Technical Discovery — `technical-blueprint.md`

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

- Goal
- Non-negotiables
- Scope: create / modify / inspect only / out of scope
- Current facts
- Contracts
- Rules
- Implementation steps
- Feature rules
- Acceptance
- Test plan
- Stop conditions
- Handoff instruction

Make steps executable in a useful order. Identify behavior to protect, checks that establish acceptance, and material unknowns that must be resolved before dependent work. Preserve the user's authorization boundaries in the handoff.
