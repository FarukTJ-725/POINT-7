#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
agent="${1:-}"
task="${2:-}"

if [[ -z "$agent" || -z "$task" ]]; then
  echo "Usage: $0 <AgentName> \"<Task>\""
  exit 1
fi

if [[ -f "$ROOT_DIR/config/point7.local.env" ]]; then
  set -a
  source "$ROOT_DIR/config/point7.local.env"
  set +a
fi

ts="$(date +%Y%m%d-%H%M%S)"
log="$ROOT_DIR/logs/${ts}-${agent,,}.log"
entry_file="$ROOT_DIR/taskboard/in-progress.md"

profile="$ROOT_DIR/agents/${agent}/README.md"
if [[ ! -f "$profile" ]]; then
  profile="$ROOT_DIR/agents/${agent}.md"
fi
if [[ ! -f "$profile" ]]; then
  echo "Unknown agent: $agent"
  exit 2
fi

echo "Running agent: $agent" | tee -a "$log"
echo "Task: $task" | tee -a "$log"
echo "Profile summary:" | tee -a "$log"
head -n 5 "$profile" | tee -a "$log"

{
  echo "## [$ts] $agent"
  echo "- Task: $task"
  echo "- Status: started"
  echo
} >> "$entry_file"

if command -v codex >/dev/null 2>&1; then
  echo "Invoking codex wrapper..." | tee -a "$log"
  if "$ROOT_DIR/tools/codex_wrapper.sh" "$agent" "$task" >> "$log" 2>&1; then
    echo "- Execution: codex wrapper completed" >> "$entry_file"
  else
    echo "- Execution: codex wrapper failed, see $log" >> "$entry_file"
  fi
else
  echo "codex not available; simulation mode" | tee -a "$log"
  echo "- Execution: simulated output (codex missing)" >> "$entry_file"
fi

echo "Agent run complete. Log: $log"
