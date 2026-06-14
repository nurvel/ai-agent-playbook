# B3 Dist Audit

## Summary
The `dist/` package is broadly suitable as agent-agnostic markdown guidance for Codex, Claude, Gemini, opencode, and similar markdown-reading coding agents.

No finding requires removing OpenSpec guidance or moving a runtime file out of `dist/` before edits. The main improvements are wording and portability clarifications around optional MCP/tool hints, one command-specific OpenSpec reference, and target-project product artifact paths.

## Scope
- Reviewed `dist/AGENTS.md`.
- Reviewed every `dist/skills/*/SKILL.md`.
- Checked naming, triggers, MCP wording, OpenSpec wording, paths, and install assumptions.
- Used an equal portability lens across Codex, Claude, Gemini, opencode, and similar agents.
- Initial audit did not change runtime files; accepted B3 edits are recorded in the resolution below.

Supporting context checked:
- `README.md`
- `scripts/install-playbook.sh`
- `planning/requirements/b3-agent-agnostic-dist-audit.md`

## Verdict
Acceptable with non-blocking edits recommended.

The package already separates runtime guidance from repo-local planning, keeps skills concise, and treats project-specific conventions as conditional. The highest-value next edit pass should preserve that shape and only reword the places where the current text may imply a specific harness, MCP setup, or target-project file layout.

## Findings

### B3-1: MCP frontmatter and exact server names are optional, but still harness-coupled
Classification: harness-specific but acceptable with clearer wording.

Evidence:
- `dist/AGENTS.md:101` defines "MCP usage".
- `dist/AGENTS.md:102` says `mcp_servers` frontmatter is a hint.
- `dist/AGENTS.md:106` to `dist/AGENTS.md:108` names `chrome-devtools`, `figma`, and `context7`.
- `dist/skills/api-integration/SKILL.md:10` to `dist/skills/api-integration/SKILL.md:11` uses `mcp_servers: context7`.
- `dist/skills/bugfix/SKILL.md:10` to `dist/skills/bugfix/SKILL.md:11` uses `mcp_servers: chrome-devtools`.
- `dist/skills/new-component/SKILL.md:9` to `dist/skills/new-component/SKILL.md:10` uses `mcp_servers: figma`.
- `dist/skills/planning/SKILL.md:10` to `dist/skills/planning/SKILL.md:11` uses `mcp_servers: context7`.

Why it matters:
MCP is a useful cross-agent concept, but not every markdown-reading agent will parse frontmatter, expose MCP tools, or use the same server ids. The current guide correctly says these are hints, but the frontmatter key still reads like structured runtime metadata.

Recommended action:
- Keep the guidance for now because it is useful and optional.
- In the B7 tool-guidance model, decide whether MCP/tool hints stay in skill frontmatter, move into a separate `dist/tools/` artifact, or become plain markdown sections.
- If editing before B7, make the wording slightly more generic: "Tool hints are optional. Use matching local tools when available; otherwise proceed from repo context."

### B3-2: `/opsx:explore` was command-specific and needed rewording
Classification: harness-specific but acceptable with clearer wording.

Original evidence before accepted edit:
- At audit time, `dist/skills/product-discovery/SKILL.md` said: "Treat this skill as closest to `/opsx:explore`..."

Why it matters:
The slash-command reference is useful to someone who knows that command, but it is not agent-agnostic. A Gemini, opencode, or plain markdown consumer may not know whether `/opsx:explore` is a command, a concept, or required tooling.

Resolution:
- Reworded to a generic pre-proposal exploration description.
- Kept the surrounding OpenSpec handoff guidance.

### B3-3: `product/roadmap.md` and `product/backlog.md` were useful defaults with too-absolute wording
Classification: target-project guidance and keep, with clearer wording recommended.

Original evidence before accepted edit:
- At audit time, `dist/skills/backlog-management/SKILL.md` made `product/backlog.md` the operational source of truth in `repo-artifacts` mode.
- At audit time, `dist/skills/roadmap-planning/SKILL.md` made `product/roadmap.md` the strategic source of truth in `repo-artifacts` mode.
- `README.md:72` to `README.md:78` explains these are optional target-project product artifacts.

Why it matters:
The repo-level README makes the optional target-project intent clear, but the runtime skill text can still override an existing project source of truth if read literally. That is not an agent-harness problem, but it is a portability issue across target repos.

Resolution:
- Kept the `product/` convention because it gives agents a predictable default.
- Reworded both skills to prefer existing project sources of truth first, then use `product/backlog.md` or `product/roadmap.md` only when repo-backed tracking is requested and no equivalent artifact exists.
- Preserved `chat-only` mode for projects using Jira, Linear, GitHub Projects, or another external tracker.

### B3-4: OpenSpec guidance is conditional target-project guidance and should stay
Classification: target-project guidance and keep.

Evidence:
- `dist/AGENTS.md:40` defers to project-specific OpenSpec skills or conventions.
- `dist/AGENTS.md:114` to `dist/AGENTS.md:115` only activates source-of-truth rules when `openspec/` exists.
- `dist/skills/product-discovery/SKILL.md:27` to `dist/skills/product-discovery/SKILL.md:50` describes OpenSpec handoff.
- `dist/skills/requirements-definition/SKILL.md:31` to `dist/skills/requirements-definition/SKILL.md:63` describes proposal, spec delta, and design mapping.
- `dist/skills/story-slicing/SKILL.md:30` to `dist/skills/story-slicing/SKILL.md:53` maps story slicing into `tasks.md`.
- `dist/skills/roadmap-planning/SKILL.md:28` to `dist/skills/roadmap-planning/SKILL.md:35` keeps roadmap state outside OpenSpec.
- `dist/skills/backlog-management/SKILL.md:28` to `dist/skills/backlog-management/SKILL.md:37` keeps backlog state outside OpenSpec.

Why it matters:
This repo does not currently use OpenSpec, but `dist/` is a portable package for target projects. The guidance is conditional, useful, and already defers to project-specific skills.

Recommended action:
- Keep OpenSpec compatibility in `dist/`.
- The command-specific reference from B3-2 was the only OpenSpec-adjacent edit.

### B3-5: Install support is Codex/Claude-only today, but that does not block the `dist/` package
Classification: defer to existing installer and harness evaluation work.

Evidence:
- `scripts/install-playbook.sh:16` to `scripts/install-playbook.sh:36` documents only Codex and Claude install targets.
- `scripts/install-playbook.sh:80` to `scripts/install-playbook.sh:99` syncs only `~/.agents` and `~/.claude`.
- `README.md:57` to `README.md:65` documents install only for Codex and Claude.

Why it matters:
The runtime markdown itself can be agent-agnostic even if the current installer only supports two harnesses. Equal support for Gemini, opencode, or other agents needs verified paths and file contracts before installer behavior changes.

Recommended action:
- Do not treat this as a `dist/` blocker.
- Handle install behavior in B4 symlink design and B10 non-native harness evaluation.

### B3-6: Core skill names, triggers, and frontmatter are portable enough to keep
Classification: agent-neutral and keep.

Evidence:
- Skill names are lowercase, descriptive, and path-aligned under `dist/skills/<name>/SKILL.md`.
- Every skill has concise `name`, `description`, and `triggers` frontmatter.
- `dist/AGENTS.md:21` to `dist/AGENTS.md:39` explains skill selection without relying on a specific agent command.

Why it matters:
Different agents may parse skill metadata differently, but the files remain readable markdown even if frontmatter is treated as plain text. The naming and trigger model is portable enough for the current package shape.

Recommended action:
- Keep names and triggers unchanged for B3.
- Leave naming and prefix strategy to B6.

## Classification Summary

| Classification | Items |
| --- | --- |
| Agent-neutral and keep | Core engineering defaults, skill names, triggers, review/planning/test/refactor/evaluation guidance |
| Target-project guidance and keep | OpenSpec compatibility, product artifact convention, React/TypeScript defaults as technology-specific guidance |
| Harness-specific but acceptable with clearer wording | MCP/tool hints, exact server names, `/opsx:explore` |
| Harness-specific and should move out of `dist/` | None identified now |

## Finding Disposition

| Finding | Disposition | Closure path |
| --- | --- | --- |
| B3-1 MCP frontmatter and exact server names | Deferred | Covered by B7 tool guidance model. Do not close as forgotten work. |
| B3-2 `/opsx:explore` wording | Applied | Reworded `dist/skills/product-discovery/SKILL.md` during the B3 edit pass. |
| B3-3 `product/roadmap.md` and `product/backlog.md` wording | Applied | Reworded `dist/skills/backlog-management/SKILL.md` and `dist/skills/roadmap-planning/SKILL.md` during the B3 edit pass. |
| B3-4 OpenSpec guidance | Keep as-is | No runtime edit needed; conditional target-project guidance is intentionally retained. |
| B3-5 Codex/Claude-only installer support | Deferred | Covered by B4 installer design and B10 non-native harness evaluation. |
| B3-6 Skill names, triggers, and frontmatter | Keep for B3 | No B3 edit needed; naming and prefix questions remain covered by B6. |

B3 is ready to archive: the two accepted runtime edits were applied, and the deferred follow-ups are recorded above.

## Applied Edit Summary
1. Reworded `/opsx:explore` in `product-discovery`.
2. Softened `product/roadmap.md` and `product/backlog.md` wording in roadmap/backlog skills so existing project sources of truth win.
3. Deferred MCP/tool-hint structure to B7.
4. Kept OpenSpec compatibility unchanged except for the command-specific wording above.
5. Kept skill names and triggers unchanged until B6.

## Follow-Up Backlog Impact
No new backlog item is required.

Existing backlog coverage is sufficient:
- B4 covers installer design and symlink behavior.
- B6 covers skill naming and prefix strategy.
- B7 covers MCP/tool guidance extraction.
- B10 covers non-native harness evaluation.
- B12 covers a later token and pragmatism cleanup pass.

## Acceptance Check
- All `dist/` runtime files were reviewed.
- All agent-specific assumptions found were classified.
- Each finding has a recommended action.
- Accepted runtime edits were applied after the audit.
- No new backlog item is needed from this audit.
