# Playbook Roadmap

## Strategic objective
- Make the portable agent package easy to install, understand, and evolve without mixing shipped guidance with repo-internal planning.

## Planning horizon
- `Now / Next / Later`

## Sequencing principles
- Preserve the install contract first.
- Keep the output package small and explicit.
- Improve repo planning only when it helps maintain the package.

## Now
- `R1` Separate portable output from repo planning
  - Goal: Move the installed package into `dist/` and repo planning into `planning/`.
  - Why now: Root-level output and product planning are easy to confuse.
  - Dependencies: Installer paths and README updates.
  - OpenSpec capability:
  - OpenSpec change:
  - Exit criteria: Install dry runs work from `dist/`; docs name only `dist/` as installed output.

## Next
- `R2` Tighten skill quality and coverage
  - Goal: Review shipped skills for overlap, missing checks, and unclear trigger behavior.
  - Why next: Structure needs to settle before content quality passes.
  - Dependencies: `R1`
  - OpenSpec capability:
  - OpenSpec change:
  - Exit criteria: Each shipped skill has a clear purpose, trigger set, and check section.

## Later
- `R3` Add lightweight release notes
  - Goal: Track meaningful package changes for users who sync the playbook into global agent folders.
  - Why later: Useful after the package boundary and content are stable.
  - Dependencies: Stable `dist/` structure.
  - OpenSpec capability:
  - OpenSpec change:
  - Exit criteria: A concise changelog or release note convention exists.

## Milestones
- `M1` Clear package boundary
  - Scope: `dist/`, `planning/`, README, and installer path updates.
  - Exit criteria: A new contributor can tell what gets installed without reading the installer.

## Risks and dependencies
- Risk: `dist/` can be mistaken for generated output.
- Dependency: README must state that `dist/` is hand-authored.
