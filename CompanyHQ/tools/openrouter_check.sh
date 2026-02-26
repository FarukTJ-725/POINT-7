#!/usr/bin/env bash
set -euo pipefail
[[ -n "${OPENROUTER_API_KEY:-}" ]] && echo "OPENROUTER_API_KEY set" || { echo "OPENROUTER_API_KEY missing"; exit 1; }
