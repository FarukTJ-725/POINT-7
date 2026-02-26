#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
task="${1:-}"

if [[ -z "$task" ]]; then
  echo "Usage: $0 \"<Task>\""
  exit 1
fi

ts="$(date +%Y%m%d-%H%M%S)"
entry_file="$ROOT_DIR/taskboard/in-progress.md"
log="$ROOT_DIR/logs/${ts}-pipeline.log"

echo "## [$ts] Pipeline" >> "$entry_file"
echo "- Task: $task" >> "$entry_file"

echo "Pipeline task: $task" | tee -a "$log"

run_stage() {
  local stage="$1"
  echo "
=== $stage ===" | tee -a "$log"
  "$ROOT_DIR/tools/run_agent.sh" "$stage" "$task" | tee -a "$log"
  echo "- Stage: $stage complete" >> "$entry_file"
}

run_stage "Architect"

unity_keywords='Unity|C#|ECS|MonoBehaviour|Android|iOS'
react_keywords='React|Next\.js|frontend|UI'

run_unity=0
run_react=0
[[ "$task" =~ ($unity_keywords) ]] && run_unity=1
[[ "$task" =~ ($react_keywords) ]] && run_react=1

if [[ "$run_unity" -eq 1 ]]; then run_stage "UnityEngineer"; fi
if [[ "$run_react" -eq 1 ]]; then run_stage "ReactEngineer"; fi
if [[ "$run_unity" -eq 0 && "$run_react" -eq 0 ]]; then
  run_stage "ReactEngineer"
fi

run_stage "QA"
run_stage "DocsPM"
run_stage "DevOps"

echo "- Human approval required: CoderX / UMAR FARUK TIJANI" >> "$entry_file"
echo "Human approval gate: please review logs and taskboard entry." | tee -a "$log"

echo "Pipeline complete. Log: $log"
