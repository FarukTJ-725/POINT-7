#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
agent="${1:-}"
subagent="${2:-}"
task="${3:-}"

if [[ -z "$agent" || -z "$subagent" || -z "$task" ]]; then
  echo "Usage: $0 <AgentName> <SubagentName> \"<Task>\""
  exit 1
fi

sub_file="$ROOT_DIR/agents/$agent/subagents/README.md"
if [[ ! -f "$sub_file" ]]; then
  echo "Subagent manifest not found for $agent"
  exit 2
fi

stamp="$(date +%Y%m%d-%H%M%S)"
log="$ROOT_DIR/logs/${stamp}-${agent,,}-${subagent,,}.log"

{
  echo "[$stamp] Subagent Execution"
  echo "Agent: $agent"
  echo "Subagent: $subagent"
  echo "Task: $task"
  echo "Manifest: $sub_file"
  echo "Execution mode: simulated subagent dispatch"
} | tee -a "$log"

echo "Subagent run complete. Log: $log"
