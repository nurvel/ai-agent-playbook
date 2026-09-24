# Personal permission policy

This document is the authoritative, harness-neutral permission policy for the personal coding-agent toolset. It describes intended behavior, not configuration syntax and not a claim that every harness can enforce every rule identically.

Generate native permissions from this document only after inspecting the installed harness version, its current official documentation, and the existing local or project configuration.

## Policy levels

- **Allow:** May proceed without a separate permission prompt when the harness can identify the operation reliably.
- **Require approval:** Must receive explicit approval at the operation boundary. Prior authorization for a bounded task may satisfy this only where the harness supports preserving that scope safely.
- **Prohibit:** Must not run. If the harness cannot reliably prohibit every form, fall back to approval and report the enforcement gap.
- **Harness default:** Use the harness's normal sandbox and approval behavior rather than adding a broader rule.

Instructions guide agent behavior. Native permissions and sandbox controls enforce what the harness can technically restrict. Do not describe an instruction or best-effort command match as a complete security boundary.

## Allow without separate approval

### Workspace inspection

- Read and search files inside the active workspace, except files covered by the sensitive-data policy below.
- Inspect directory and repository structure.

### Read-only Git inspection

Allow these read-only forms where the harness can match them without also allowing mutation:

- `git status`
- `git diff`
- `git log`
- `git show`
- `git rev-parse`
- `git ls-files`
- `git ls-tree`
- `git branch --show-current`
- `git remote -v`

Treat `git branch --show-current` and `git remote -v` as exact read-only forms, not as broad `git branch` or `git remote` prefixes. Additional arguments are acceptable only where they cannot select a mutating subcommand.

### Read-only GitHub CLI inspection

Allow these command families with additional arguments where the harness can distinguish them from mutating operations:

- `gh pr view`
- `gh pr list`
- `gh pr diff`
- `gh pr checks`
- `gh pr status`
- `gh issue view`
- `gh issue list`
- `gh run view`
- `gh run list`

Do not create a broad `gh` allow rule. Commands not listed here follow the harness default or the approval requirements below.

## Require explicit approval

### Remote and outward-facing changes

- Push commits, branches, or tags.
- Add, remove, or change Git remotes.
- Create, edit, merge, close, reopen, label, comment on, or otherwise mutate remote pull requests and issues.
- Create releases or modify repository settings, secrets, variables, hooks, permissions, or workflows through a remote API.
- Publish packages, container images, artifacts, websites, or deployments.
- Change cloud, cluster, infrastructure, DNS, hosting, or other external-service state.
- Send messages, submit forms, upload files, or perform another externally visible action.
- Use an MCP or connector tool that modifies external state.

### High-impact local operations

- Recursively delete files or directories.
- Discard, overwrite, or rewrite existing user work, the Git index, worktree state, local history, branches, tags, or other refs. This includes destructive forms of `git reset`, `git clean`, `git restore`, and `git checkout`, branch or tag deletion, and history-changing `git rebase` or `git merge` operations.
- Modify files outside the active workspace.
- Change system, shell, editor, harness, credential, or global Git configuration.
- Install or remove system-wide software.

Normal edits inside the active workspace follow the harness default and the user's authorized task scope. Staging, local commits, and branch creation likewise follow the task's explicit authorization and applicable project instructions. Do not add a blanket approval rule that makes routine, already authorized project work unusable.

### Network and remote access

Require approval for command families that initiate network transfer or remote sessions unless a narrower, already approved project command is represented safely:

- `ssh`
- `scp`
- `rsync`
- `curl`
- `wget`
- cloud, cluster, deployment, and hosting CLIs

A harness-native read-only web or documentation tool may follow its own scoped approval policy. Do not translate this section into unrestricted network access for sandboxed commands.

### Sensitive data

Require approval before reading credential, token, key, or secret-bearing files, including:

- `.env` and `.env.*`, except documented, committed, secret-free templates such as `.env.example` or `.env.sample`
- private keys and credential exports
- OAuth client-secret files
- harness authentication stores

Never print, log, commit, or transmit secret values. If the harness cannot restrict these reads reliably, report that limitation and rely on a stronger sandbox or filesystem boundary instead of claiming enforcement.

## Prohibit when reliably enforceable

- Force-push or otherwise rewrite shared remote history.
- Forced recursive deletion, including known forms such as `rm -rf`.
- Bypass, disable, or weaken the active harness permission or sandbox system.
- Commit credentials or secret values.
- Exfiltrate credentials, private keys, tokens, or other secrets.

Command-prefix rules cannot generally recognize every flag order, alias, shell wrapper, or indirect invocation. For example, a rule matching `git push --force` may not match `git push origin main --force`. Generate tested prohibitions for forms the harness can express, require approval for the broader command family, and report the remaining gap.

## Harness defaults and precedence

- Keep the harness's normal behavior for operations not covered here.
- Use the harness's native sandbox and permission system; do not enable unrestricted, bypass-permission, or danger-full-access modes.
- Preserve stricter managed, machine, user, and project rules.
- Merge with existing configuration instead of replacing it.
- Project-specific instructions may narrow this policy or define approved project commands. They must not silently weaken a technical prohibition or a stronger existing rule.
- Scope generated rules to the intended user, machine, or project. Do not commit personal permission exceptions into a shared project without an explicit decision.

## Native configuration generation contract

When asked to generate permissions for a target harness:

1. Confirm the target harness, installed version, operating system, configuration scope, and whether the request is proposal-only or includes installation.
2. Consult the current official documentation for that exact harness version or the closest documented version. Prefer native sandbox and approval controls over prompt instructions.
3. Inspect the existing configuration and rule precedence before proposing a change.
4. Produce the smallest mergeable patch or fragment. Do not replace the complete configuration file or remove unrelated rules.
5. Map every generated rule back to a policy item in this document.
6. Classify each policy item as:
   - reliably enforced;
   - approval-gated;
   - instruction-only; or
   - unsupported by the harness.
7. Preserve stricter existing behavior. Treat ambiguous overlaps or locally modified generated rules as conflicts and stop for review.
8. Include representative positive and negative tests, especially for command prefixes, alternative flag positions, compound commands, sensitive-file reads, network access, and MCP mutations.
9. Use the harness's own parser, diagnostics, or policy checker when available. A file that parses is not proof that every policy intent is enforced.
10. Show the proposed patch, enforcement map, limitations, and validation commands before applying it. Applying it requires a separate explicit request.
11. After application, read back the active configuration and run the applicable validation cases before reporting success.

A useful request is:

> Read `permissions/README.md`. Using the installed target harness version and its current official documentation, propose the smallest native configuration change that implements this policy. Preserve stricter and unrelated existing settings. Show the patch, enforcement map, unsupported items, and validation commands. Do not apply it yet.