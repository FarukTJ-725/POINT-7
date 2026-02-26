#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
agent="${1:-}"
prompt="${2:-}"

if [[ -z "$agent" || -z "$prompt" ]]; then
  echo "Usage: $0 <AgentName> \"<Task>\""
  exit 1
fi

unsafe_patterns=("rm -rf" "sudo " "~/.ssh" "chmod 777" "> /etc/")
for p in "${unsafe_patterns[@]}"; do
  if [[ "$prompt" == *"$p"* ]]; then
    echo "Blocked unsafe pattern: $p"
    exit 2
  fi
done

case "$agent" in
  ReactEngineer) workdir="$ROOT_DIR/projects/web-react" ;;
  UnityEngineer) workdir="$ROOT_DIR/projects/unity-game" ;;
  *) workdir="$ROOT_DIR" ;;
esac

if ! command -v codex >/dev/null 2>&1; then
  echo "codex CLI not installed. Install and re-run."
  echo "Expected command: codex --version"
  exit 3
fi

(
  cd "$workdir"
  codex "$prompt"
)
