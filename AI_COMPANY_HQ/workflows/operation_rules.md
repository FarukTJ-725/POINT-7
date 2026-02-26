# Operation Rules

## Code Review Rules
- Minimum one peer review; critical systems require two.
- Validate architecture alignment, test quality, and security impact.
- Block merge on unresolved critical comments.

## Documentation Rules
- Update docs in same PR as behavior change.
- Record decisions in decision log for architecture/scope changes.
- Include runbooks for operationally significant changes.

## Naming Conventions
- Unity: PascalCase classes, camelCase fields, suffix interfaces with `I`.
- React/TS: PascalCase components, camelCase variables, kebab-case files where framework convention applies.
- Branches: `type/scope-short-description`.

## Branching Strategy
- Trunk-based with short-lived feature branches.
- Protected main branch with required status checks.
- Release branches only for stabilization windows.

## Versioning Strategy
- Semantic versioning for services/libraries.
- Game/web release versions include build metadata.
- Breaking API changes require major version bump and migration guide.

## Definition of Professional Quality
- Meets acceptance criteria and non-functional requirements.
- Observable, secure, tested, and maintainable.
- Documented ownership, rollback plan, and support readiness.
