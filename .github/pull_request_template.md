## Summary

- What is changed
- Why it is changed

## Agent Role Checklist

### 1) Product/Gameplay
- [ ] Core loop is described in 1-2 sentences
- [ ] Scope is still "small and shippable"
- [ ] Acceptance criteria are explicit and testable

### 2) iOS Architecture
- [ ] Module boundaries are respected (`App/Core/Features/Services/Models`)
- [ ] Dependencies are injected via protocols (no gameplay singletons)
- [ ] No business logic leaked into SwiftUI Views
- [ ] Anti-pattern risks reviewed (tight coupling, god objects, hidden side effects)

### 3) Gameplay Implementation
- [ ] Mechanic works on simulator
- [ ] State transitions are deterministic (idle/running/paused/gameOver)
- [ ] Performance considerations reviewed for update loop

### 4) UI/Design System
- [ ] UI follows tokens from `Docs/DesignSystem/DesignTokens.md`
- [ ] Components are reusable and consistent
- [ ] Layout works for iPhone portrait baseline

### 5) QA/Test
- [ ] Unit tests added/updated for game state or services
- [ ] Snapshot tests added/updated for impacted UI screens
- [ ] Manual regression checklist executed

## Test Evidence

- Device/Simulator:
- iOS version:
- Test commands used:
- Notes/screenshots:

## Risks and Follow-ups

- Known limitations:
- Deferred tasks:
