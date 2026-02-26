#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
failures=0

check_exists_nonempty() {
  local p="$1"
  if [[ ! -s "$p" ]]; then
    echo "[FAIL] missing or empty: $p"
    failures=$((failures+1))
  else
    echo "[OK] $p"
  fi
}

check_exec() {
  local p="$1"
  if [[ ! -x "$p" ]]; then
    echo "[FAIL] not executable: $p"
    failures=$((failures+1))
  else
    echo "[OK] executable $p"
  fi
}

check_json() {
  local p="$1"
  if python -m json.tool "$p" >/dev/null 2>&1; then
    echo "[OK] valid JSON $p"
  else
    echo "[FAIL] invalid JSON $p"
    failures=$((failures+1))
  fi
}

echo "Verifying POINT7 CompanyHQ at $ROOT_DIR"

required_files=(
  "$ROOT_DIR/README.md"
  "$ROOT_DIR/LICENSE"
  "$ROOT_DIR/config/point7.env.example"
  "$ROOT_DIR/config/openclaw.openai-codex.json"
  "$ROOT_DIR/config/openclaw.hybrid.json"
  "$ROOT_DIR/agents/Architect.md"
  "$ROOT_DIR/playbooks/workflow.md"
  "$ROOT_DIR/taskboard/backlog.md"
  "$ROOT_DIR/tools/run_agent.sh"
  "$ROOT_DIR/tools/run_pipeline.sh"
  "$ROOT_DIR/tools/codex_wrapper.sh"
)

for f in "${required_files[@]}"; do
  check_exists_nonempty "$f"
done

check_json "$ROOT_DIR/config/openclaw.openai-codex.json"
check_json "$ROOT_DIR/config/openclaw.hybrid.json"

exec_files=(
  "$ROOT_DIR/bootstrap/bootstrap.sh"
  "$ROOT_DIR/bootstrap/verify.sh"
  "$ROOT_DIR/bootstrap/doctor.sh"
  "$ROOT_DIR/tools/run_agent.sh"
  "$ROOT_DIR/tools/run_pipeline.sh"
  "$ROOT_DIR/tools/codex_wrapper.sh"
  "$ROOT_DIR/tools/ollama_check.sh"
  "$ROOT_DIR/tools/openrouter_check.sh"
  "$ROOT_DIR/tools/openai_check.sh"
)
for f in "${exec_files[@]}"; do
  check_exec "$f"
done

if [[ "$failures" -ne 0 ]]; then
  echo "Verification failed with $failures issue(s)."
  exit 1
fi

echo "Verification passed."
