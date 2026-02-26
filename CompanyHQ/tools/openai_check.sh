#!/usr/bin/env bash
set -euo pipefail
[[ -n "${OPENAI_API_KEY:-}" ]] && echo "OPENAI_API_KEY set" || { echo "OPENAI_API_KEY missing"; exit 1; }
