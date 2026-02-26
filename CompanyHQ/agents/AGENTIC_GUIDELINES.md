# POINT7 Agentic Markdown Guidelines

All agent packs are folder-based and normalized for consistency:

- `README.md` (identity + scope + pack map)
- `skills/` (core and domain competencies)
- `rules/` (core, security, and boundaries)
- `workflow/` (main and escalation flows)
- `plugins/` (tool/script integrations)
- `templates/` (output artifacts)
- `handoff/` (definition-of-done + gate criteria)

## Authoring Standard
- Keep instructions deterministic and action-oriented.
- Prefer concrete scripts and examples over abstract guidance.
- Every stage must produce auditable evidence in logs/taskboard.
- Do not include secrets; reference env vars only.
