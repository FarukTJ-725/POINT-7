# POINT7 CompanyHQ

POINT7 CompanyHQ is a lightweight “company operating system” for running coordinated multi-agent software delivery with a human approval gate. It is designed to run locally first, with OpenAI Codex as the primary execution path and Ollama/OpenRouter as fallback providers.

## What POINT7 is

POINT7 gives you:
- 6 role-specific agents + 1 human operator profile.
- Fully loaded agent packs (skills, rules, workflows, plugins, script macros, templates, DoD).
- Workspace boundaries for React and Unity streams.
- A taskboard workflow (`backlog -> in-progress -> done`).
- Practical playbooks for standards, security, incidents, and delivery.
- Bootstrap, verify, and doctor tooling to keep setup repeatable.

## Folder tour

- `bootstrap/`: setup, validation, diagnostics.
- `config/`: env templates, OpenClaw examples, model routing.
- `agents/`: agent packs + agentic markdown guidelines.
- `playbooks/`: execution rules and operating policy.
- `taskboard/`: markdown Kanban with templates.
- `tools/`: local orchestration scripts.
- `projects/`: bounded workspaces (`unity-game`, `web-react`).
- `logs/`: execution logs.

## Quickstart

```zsh
cd ~/Desktop/POINT7/CompanyHQ
./bootstrap/bootstrap.sh
./bootstrap/verify.sh
./tools/run_pipeline.sh "React UI refresh with Unity telemetry bridge"
```

## Environment setup

```zsh
cp config/point7.local.env.example config/point7.local.env
$EDITOR config/point7.local.env
```

`config/point7.local.env` is ignored by git. Keep secrets only in environment files or shell session.

## Agent packs and operating model

- Agent packs are in `agents/*.md`.
- Shared specification: `agents/AGENTIC_GUIDELINES.md`.
- Pipeline orchestration: Architect → (ReactEngineer and/or UnityEngineer) → QA → DocsPM → DevOps → Human approval gate.

## Add projects safely

- Unity work goes in `projects/unity-game/`.
- React/Web work goes in `projects/web-react/`.
- Keep shared architecture docs in root-level playbooks instead of mixing codebases.

## Security notes

- Never commit secrets. Use `config/point7.local.env` or exported env vars.
- `tools/codex_wrapper.sh` blocks obvious dangerous command patterns.
- Use least privilege and human approval before production-impacting actions.
