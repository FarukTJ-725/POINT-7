#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

print_header() {
  printf "
== %s ==
" "$1"
}

ensure_path() {
  local path="$1"
  local kind="$2"
  if [[ "$kind" == "dir" ]]; then
    mkdir -p "$path"
  else
    touch "$path"
  fi
}

print_header "POINT7 CompanyHQ Bootstrap"
printf "Root: %s
" "$ROOT_DIR"

paths=(
  "$ROOT_DIR/bootstrap"
  "$ROOT_DIR/config"
  "$ROOT_DIR/agents"
  "$ROOT_DIR/playbooks"
  "$ROOT_DIR/taskboard/templates"
  "$ROOT_DIR/tools"
  "$ROOT_DIR/logs"
  "$ROOT_DIR/projects/unity-game"
  "$ROOT_DIR/projects/web-react"
)

for d in "${paths[@]}"; do
  ensure_path "$d" dir
done

ensure_path "$ROOT_DIR/logs/.keep" file

print_header "Tooling checks"
if command -v git >/dev/null 2>&1; then
  git --version
else
  echo "[WARN] git not found"
fi

if command -v codex >/dev/null 2>&1; then
  codex --version || true
else
  echo "[WARN] codex CLI not found (primary execution path unavailable)"
fi

if command -v ollama >/dev/null 2>&1; then
  ollama --version || true
else
  echo "[WARN] ollama not found (fallback unavailable)"
fi

if [[ -f "$ROOT_DIR/projects/web-react/package.json" ]]; then
  if command -v node >/dev/null 2>&1 && command -v npm >/dev/null 2>&1; then
    node --version
    npm --version
  else
    echo "[WARN] web-react package.json present but node/npm missing"
  fi
else
  echo "[INFO] Node/npm checks skipped (no web-react/package.json yet)"
fi

print_header "NEXT STEPS"
echo "1) cp config/point7.local.env.example config/point7.local.env"
echo "2) Edit local env values"
echo "3) ./bootstrap/verify.sh"
echo "4) ./tools/run_pipeline.sh \"Your first task\""
