# Platformer iOS Architecture Blueprint

## Architectural Principles
- Gameplay in SpriteKit scene layer, app shell in SwiftUI.
- Dependency Injection for all services.
- Deterministic state machine for game phase transitions.
- Keep frame-update code minimal and predictable.

## High-Level Modules
- `App`: bootstrap, scene routing, DI container.
- `Core/Engine`: game loop helpers, fixed-step timing abstraction.
- `Core/Physics`: collision categories, contact resolver.
- `Features/GameScene`: level runtime, player controller, obstacle systems.
- `Features/Menu`: home, tier select, settings.
- `Features/HUD`: progress meter, attempts, pause/resume.
- `Models`: `LevelConfig`, `PlayerConfig`, `RunResult`, `ProgressState`.
- `Services`: persistence, audio, haptics, analytics.

## Apple Guideline Alignment
- Respect safe areas and notch layouts for HUD.
- Minimum touch target for interactive UI: 44x44pt.
- Haptics used as supportive feedback only, not mandatory signal.
- Accessibility labels on menu/UI controls.
- Smooth animation target 60 FPS on supported devices.

## Core State Machine
- `idle -> running -> (paused <-> running) -> completed | failed`
- `failed -> restarting -> running`
- `completed -> nextLevelUnlocked -> idle`

## Anti-patterns to avoid
- Business logic in `SKScene.update(_:)` monolith.
- Global mutable singletons for score/progress.
- Physics categories hardcoded across multiple files.
- Direct service calls from UI views without ViewModel boundary.

## Testability Strategy
- Extract pure movement and collision decision logic into testable structs.
- Unit test phase transitions and unlock rules.
- Snapshot test main menu, level select, game over overlays.
