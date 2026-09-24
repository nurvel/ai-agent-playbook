---
name: nv-refactor
description: Simplify or restructure existing code while preserving behavior. Use to reduce complexity, improve boundaries, or remove duplication without changing the feature.
---

## Approach

- Identify the concrete structural problem and the behavior or public contracts that must remain unchanged.
- Inspect callers and existing tests before changing boundaries. Include relevant ordering, side effects, errors, and data shapes in the preservation check.
- Choose the smallest structural improvement and proceed in reviewable steps. Extract only when it improves clarity, testing, or demonstrated reuse.
- Reduce nesting, mixed responsibilities, dead code, or duplication without moving the same complexity behind new indirection.
- Keep feature changes and bug fixes separate unless they are explicitly part of the requested scope. Report unrelated discoveries rather than silently changing behavior.

## Verification

- Use relevant existing checks to compare behavior before and after the change when practical.
- Add focused characterization tests where behavior is important and insufficiently understood or protected. Avoid tests tied only to the old internal structure.
- Confirm that callers and contracts remain compatible and that the result is easier to understand or change.

## Output

Explain what became simpler, which behavior was preserved, and how it was checked. State any remaining uncertainty; do not equate fewer lines or more files with a successful refactor.
