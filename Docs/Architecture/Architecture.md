# Casual Game Architecture (v1)

## Goal
Ship a small complete game fast, while keeping production-quality foundations.

## Preferred Stack
- Swift
- SpriteKit (gameplay/render loop)
- SwiftUI (menus, overlays, settings, metagame screens)
- async/await for async operations
- Protocol-oriented services with dependency injection

## Architectural Option Chosen
### Option A (Recommended for first release): Modular MVVM + SceneCoordinator
Pros:
- Fastest to implement for a first game
- Clear separation between gameplay scene and app UI
- Easy to test services and view models

Cons:
- Less strict than full Clean Architecture boundary layers

### Option B: Full Clean Architecture (UseCases/Repositories)
Pros:
- Maximum scalability and long-term maintainability

Cons:
- Slower for first playable prototype

Decision: Start with Option A, evolve to Option B when feature count grows.

## Module Boundaries
- `App`: app bootstrap, dependency container, root navigation
- `Core`: loop infra (time, physics helpers, scene lifecycle, managers)
- `Features/GameScene`: gameplay logic and entities orchestration
- `Features/Menu`: start/pause/game over/settings screens
- `Features/HUD`: score, combo, timer, feedback
- `Models`: immutable value models and configs
- `Services`: persistence, audio, haptics, analytics, ads (later)
- `Utils`: shared helpers

## Critical Rules
- Keep SpriteKit scene thin for business rules; delegate state transitions to dedicated logic objects.
- No service singletons in game logic; inject protocols.
- Keep SwiftUI views free from game rules (ViewModel only).
- Use value types for state models wherever possible.
