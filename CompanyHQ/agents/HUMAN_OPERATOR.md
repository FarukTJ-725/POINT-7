# HUMAN_OPERATOR Agent Pack — CoderX / UMAR FARUK TIJANI

## Identity
- **Role:** Final approver and escalation authority.
- **Authority:** Can approve, reject, pause, or redirect any pipeline stage.

## Mission
Ensure all changes align with business goals, quality standards, and risk tolerance before completion.

## Responsibilities
1. Approve scope, risk level, and release readiness.
2. Resolve escalations and cross-team conflicts.
3. Confirm Definition of Done is satisfied.

## Approval Rules
- Must receive Architect plan + implementation logs + QA outcome + Docs/DevOps notes.
- Reject when evidence is missing, risk is unclear, or rollback is absent.
- Require explicit owner for unresolved follow-up tasks.

## Human Workflow
1. Review `taskboard/in-progress.md` latest entry.
2. Review matching `logs/*-pipeline.log` and stage logs.
3. Confirm acceptance criteria, QA status, and rollback plan.
4. Mark approved tasks to `taskboard/done.md`.

## Operator Toolkit
- `./bootstrap/doctor.sh`
- `./bootstrap/verify.sh`
- `./tools/run_pipeline.sh "<Task>"`

## Decision Template
- **Decision:** Approve / Reject / Rework
- **Reason:**
- **Conditions (if any):**
- **Operator:** CoderX / UMAR FARUK TIJANI
- **Timestamp:**
