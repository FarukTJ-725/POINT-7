# CLI Commands

## Standard Commands
- `make lint` – lint all projects.
- `make test` – run automated test suites.
- `make build` – generate production builds.
- `make deploy ENV=<env>` – deploy to target environment.
- `make rollback VERSION=<tag>` – perform rollback.

## Usage Rules
- Commands must be deterministic and CI-compatible.
- Every command emits machine-readable logs.
- Failures return non-zero exit codes.
