#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
name="${1:-}"
out="${2:-}"

if [[ -z "$name" || -z "$out" ]]; then
  echo "Usage: $0 <template-name> <output-file>"
  echo "Templates: gdd, trd, game-idea, app-idea, mechanics-spec, netcode"
  exit 1
fi

case "$name" in
  gdd) src="$ROOT_DIR/resources/templates/gdd-template.md" ;;
  trd) src="$ROOT_DIR/resources/templates/trd-template.md" ;;
  game-idea) src="$ROOT_DIR/agents/UnityEngineer/templates/02-game-idea-template.md" ;;
  app-idea) src="$ROOT_DIR/agents/ReactEngineer/templates/02-app-idea-template.md" ;;
  mechanics-spec) src="$ROOT_DIR/agents/UnityEngineer/templates/03-mechanics-spec-template.md" ;;
  netcode) src="$ROOT_DIR/agents/UnityEngineer/templates/04-netcode-architecture-template.md" ;;
  *) echo "Unknown template: $name"; exit 2 ;;
esac

mkdir -p "$(dirname "$out")"
cp "$src" "$out"
echo "Created $out from $src"
