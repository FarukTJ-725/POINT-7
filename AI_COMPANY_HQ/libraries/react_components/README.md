# React Component Library Standards

## Folder Structure
- `/src/components`
- `/src/hooks`
- `/src/theme`
- `/stories`
- `/tests`
- `/docs`

## Modules
- Layout System
- Auth UI
- Form System
- Table System
- Dashboard Widgets
- Modal System
- Notification System

## Required Files
- `index.ts`
- `<Component>.tsx`
- `<Component>.test.tsx`
- `<Component>.stories.tsx`
- `docs/<Component>.md`

## Extension Rules
- Follow composition over inheritance.
- All public props typed and documented.
- No breaking changes without major version bump.

## Documentation Rules
- Usage examples and accessibility notes.
- Theming and customization guidance.

## Testing Rules
- Rendering + interaction tests.
- Accessibility assertions.
- Visual regression snapshots for shared components.
