# POINT7 Agentic Markdown Guidelines (Anthropic-style Practical Profile)

This framework uses a practical agent-card format inspired by agentic markdown patterns:

1. **Identity**: role, scope, and boundaries.
2. **Mission**: single outcome-oriented objective.
3. **Skills**: concrete capabilities the agent is expected to apply.
4. **Operating Rules**: non-negotiable constraints and safety rails.
5. **Workflow**: deterministic step sequence for execution.
6. **Plugins and Integrations**: tools/scripts/docs the agent can call.
7. **Script Macros**: copy-paste commands for repeatability.
8. **Templates Owned**: artifacts the agent produces/maintains.
9. **Definition of Done**: gate criteria before handoff/approval.

## Why this structure
- Reduces role ambiguity.
- Improves deterministic handoffs between agents.
- Produces auditable outcomes for the human approval gate.

## Enforcement
- Agents must operate within their workspace scope.
- Every stage should leave evidence in `taskboard/in-progress.md` and `logs/`.
- Missing evidence means not done.
