# Agent Workflow for Fast Casual iOS Development

## Recommended Agent Roles

1. Product/Gameplay Agent
- Defines one core loop
- Controls scope and feature cuts
- Writes acceptance criteria per phase

2. iOS Architecture Agent
- Owns module boundaries and DI
- Reviews anti-patterns and coupling
- Keeps codebase testable

3. Gameplay Implementation Agent
- Implements SpriteKit scene logic
- Integrates input, collisions, score
- Optimizes update loop performance

4. UI/Design System Agent
- Owns SwiftUI overlays/HUD/menu
- Maps design tokens to reusable components
- Ensures Apple HIG consistency

5. QA/Test Agent
- Adds unit tests for state transitions
- Adds snapshot tests for menus/HUD
- Guards regression before release

## Parallel Work Strategy

- Stream A: Gameplay loop in `Features/GameScene`
- Stream B: HUD/Menu in `Features/HUD` and `Features/Menu`
- Stream C: Services and tests in `Services` and `Tests`

## Definition of Done per Feature

- Playable on simulator
- No hardcoded global singletons in logic
- State transitions unit-tested
- Critical screens snapshot-tested
