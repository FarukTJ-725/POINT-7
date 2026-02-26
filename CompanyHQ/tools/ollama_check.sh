#!/usr/bin/env bash
set -euo pipefail
if command -v ollama >/dev/null 2>&1; then
  ollama --version
else
  echo "ollama missing"
  exit 1
fi
