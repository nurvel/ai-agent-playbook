#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "${script_dir}/.." && pwd)"

dry_run=0
target_codex=0
target_claude=0
targets_explicit=0

print_usage() {
  cat <<'EOF'
Usage: scripts/install-playbook.sh [--codex] [--claude] [--dry-run]

Installs this playbook into user-level Codex and/or Claude directories.

Options:
  --codex    Sync to ~/.agents
  --claude   Sync to ~/.claude
  --dry-run  Show what would change without writing files
  --help     Show this help

Default behavior:
  If no target is selected, sync to both Codex and Claude.

Behavior:
  - Non-destructive: updates matching files but does not delete other files
  - Overwrites existing playbook files with the current repo version
  - Syncs only:
    - AGENTS.md -> ~/.agents/AGENTS.md
    - AGENTS.md -> ~/.claude/CLAUDE.md
    - skills/*   -> ~/.agents/skills/*
    - skills/*   -> ~/.claude/skills/*
EOF
}

log() {
  printf '%s\n' "$*"
}

require_path() {
  local path="$1"
  local label="$2"

  if [[ ! -e "$path" ]]; then
    log "Missing ${label}: ${path}"
    exit 1
  fi
}

ensure_dir() {
  local dir="$1"

  if [[ "$dry_run" -eq 1 ]]; then
    log "[dry-run] mkdir -p ${dir}"
    return
  fi

  mkdir -p "$dir"
}

run_rsync() {
  local src="$1"
  local dest="$2"

  local -a cmd=(rsync -a)

  if [[ "$dry_run" -eq 1 ]]; then
    cmd+=(-n -v)
  fi

  cmd+=("$src" "$dest")

  "${cmd[@]}"
}

sync_codex() {
  local codex_dir="${HOME}/.agents"
  local codex_skills_dir="${codex_dir}/skills"

  log "Syncing Codex playbook -> ${codex_dir}"
  ensure_dir "$codex_dir"
  ensure_dir "$codex_skills_dir"
  run_rsync "${repo_root}/AGENTS.md" "${codex_dir}/AGENTS.md"
  run_rsync "${repo_root}/skills/" "${codex_skills_dir}/"
}

sync_claude() {
  local claude_dir="${HOME}/.claude"
  local claude_skills_dir="${claude_dir}/skills"

  log "Syncing Claude playbook -> ${claude_dir}"
  ensure_dir "$claude_dir"
  ensure_dir "$claude_skills_dir"
  run_rsync "${repo_root}/AGENTS.md" "${claude_dir}/CLAUDE.md"
  run_rsync "${repo_root}/skills/" "${claude_skills_dir}/"
}

validate_target() {
  local label="$1"
  local root="$2"
  local guide_file="$3"

  require_path "$guide_file" "${label} guide file"
  require_path "${root}/skills" "${label} skills directory"

  if ! find "${root}/skills" -mindepth 1 -maxdepth 1 -type d | read -r _; then
    log "Validation failed: ${label} skills directory is empty"
    exit 1
  fi
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --codex)
      target_codex=1
      targets_explicit=1
      ;;
    --claude)
      target_claude=1
      targets_explicit=1
      ;;
    --dry-run)
      dry_run=1
      ;;
    --help|-h)
      print_usage
      exit 0
      ;;
    *)
      log "Unknown option: $1"
      print_usage
      exit 1
      ;;
  esac
  shift
done

if [[ "$targets_explicit" -eq 0 ]]; then
  target_codex=1
  target_claude=1
fi

require_path "${repo_root}/AGENTS.md" "repo AGENTS.md"
require_path "${repo_root}/skills" "repo skills directory"

if ! command -v rsync >/dev/null 2>&1; then
  log "Missing required command: rsync"
  exit 1
fi

if [[ "$target_codex" -eq 1 ]]; then
  sync_codex
fi

if [[ "$target_claude" -eq 1 ]]; then
  sync_claude
fi

if [[ "$dry_run" -eq 1 ]]; then
  log "Dry run complete."
  exit 0
fi

if [[ "$target_codex" -eq 1 ]]; then
  validate_target "Codex" "${HOME}/.agents" "${HOME}/.agents/AGENTS.md"
fi

if [[ "$target_claude" -eq 1 ]]; then
  validate_target "Claude" "${HOME}/.claude" "${HOME}/.claude/CLAUDE.md"
fi

log "Install complete."
