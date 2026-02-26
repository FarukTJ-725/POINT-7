# Unity Mechanics Library Standards

## Folder Structure
- `/runtime`: production code.
- `/editor`: tooling and inspectors.
- `/tests`: unit/integration/performance tests.
- `/samples`: usage examples.
- `/docs`: API and integration guides.

## Modules
- Camera System
- Inventory System
- Dialogue System
- Quest System
- Research Tree System
- Resource Economy System
- Card System
- City Placement System
- Offline Idle Module
- Save/Load Framework

## Required Files (per module)
- `README.md`
- `CHANGELOG.md`
- `runtime/<Module>.cs`
- `tests/<Module>Tests.cs`
- `docs/integration.md`

## Extension Rules
- New features behind explicit interfaces.
- Preserve backward compatibility for public API.
- Add migration notes for breaking changes.

## Documentation Rules
- Include architecture diagram and dependency map.
- Provide setup and integration steps.
- Document performance characteristics.

## Testing Rules
- Unit tests for logic.
- Integration tests for cross-system behavior.
- Performance benchmarks on target devices.
