#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

source_if_exists() {
  local file="$1"
  if [[ -f "$file" ]]; then
    set -a
    source "$file"
    set +a
  fi
}

source_if_exists "$ROOT_DIR/config/point7.local.env"

echo "POINT7 Doctor Report"
echo "--------------------"
echo "Date: $(date -u '+%Y-%m-%dT%H:%M:%SZ')"
echo "OS: $(uname -a)"
echo "Shell: ${SHELL:-unknown}"

echo
for cmd in git codex ollama node npm; do
  if command -v "$cmd" >/dev/null 2>&1; then
    echo "$cmd: $($cmd --version 2>/dev/null | head -n 1)"
  else
    echo "$cmd: MISSING"
  fi
done

echo
env_keys=(OPENAI_API_KEY OPENROUTER_API_KEY OLLAMA_BASE_URL POINT7_ROOT)
for key in "${env_keys[@]}"; do
  if [[ -n "${!key:-}" ]]; then
    echo "$key: set"
  else
    echo "$key: unset"
  fi
done

if [[ -z "${OPENAI_API_KEY:-}" ]]; then
  echo "[WARN] OPENAI_API_KEY is missing. Primary path may not run."
fi
if [[ -z "${OPENROUTER_API_KEY:-}" ]]; then
  echo "[WARN] OPENROUTER_API_KEY is missing. OpenRouter fallback unavailable."
fi

if command -v ollama >/dev/null 2>&1; then
  if ! ollama list >/dev/null 2>&1; then
    echo "[WARN] ollama appears installed but not responding. Start it with: ollama serve"
  fi
fi
