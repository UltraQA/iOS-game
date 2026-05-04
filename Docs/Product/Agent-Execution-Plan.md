# Agent Execution Plan (Sprint Tracker)

## Status Legend
- `todo`
- `in-progress`
- `done`

## Responsibility Model
- `Owner`: agent that executes the task.
- `Control`: Product agent validates scope, acceptance criteria, and completion quality.

## Phase 0: Discovery and Product Direction
- [ ] Status: `todo` | Define theme candidates (3 options) and pick one.
Owner: Product Agent
Control: Product Agent

- [ ] Status: `todo` | Define UX pillars (speed, readability, retry friction).
Owner: Product Agent
Control: Product Agent

- [ ] Status: `todo` | Freeze MVP scope and out-of-scope list.
Owner: Product Agent
Control: Product Agent

## Phase 1: Architecture and Technical Design
- [ ] Status: `todo` | Finalize module boundaries and data flow.
Owner: iOS Architect Agent
Control: Product Agent

- [ ] Status: `todo` | Finalize gameplay state machine and transition rules.
Owner: iOS Architect Agent
Control: Product Agent

- [ ] Status: `todo` | Define level data contract (`LevelConfig`, difficulty tier policy).
Owner: iOS Architect Agent
Control: Product Agent

- [ ] Status: `todo` | Define performance budget and technical constraints.
Owner: iOS Architect Agent
Control: Product Agent

## Phase 2: Gameplay Core Implementation
- [ ] Status: `in-progress` | Implement player controller (run/jump/ground detection).
Owner: Gameplay Engineer Agent
Control: Product Agent

- [ ] Status: `in-progress` | Implement obstacle system and collision outcomes.
Owner: Gameplay Engineer Agent
Control: Product Agent

- [ ] Status: `in-progress` | Implement finish gate and level completion logic.
Owner: Gameplay Engineer Agent
Control: Product Agent

- [x] Status: `done` | Implement fail/retry loop under 1 second restart time.
Owner: Gameplay Engineer Agent
Control: Product Agent

- [x] Status: `done` | Integrate haptics and basic SFX feedback.
Owner: Gameplay Engineer Agent
Control: Product Agent

## Phase 3: UI and UX Implementation
- [ ] Status: `todo` | Implement Home, Tier Select, Level Select screens.
Owner: UI Agent
Control: Product Agent

- [ ] Status: `todo` | Implement Gameplay HUD (meter, attempts, pause).
Owner: UI Agent
Control: Product Agent

- [ ] Status: `todo` | Implement Pause/Fail/Complete overlays.
Owner: UI Agent
Control: Product Agent

- [ ] Status: `todo` | Apply design tokens and component consistency checks.
Owner: UI Agent
Control: Product Agent

## Phase 4: Progression and Persistence
- [ ] Status: `in-progress` | Implement level unlock progression per tier.
Owner: Gameplay Engineer Agent
Control: Product Agent

- [ ] Status: `in-progress` | Implement persistent save for best score/stars/unlocks.
Owner: iOS Architect Agent
Control: Product Agent

- [x] Status: `done` | Implement continue-from-last-level behavior.
Owner: Gameplay Engineer Agent
Control: Product Agent

## Phase 5: QA and Test Coverage
- [x] Status: `done` | Add unit tests for state transitions and progression rules.
Owner: QA/Test Agent
Control: Product Agent

- [x] Status: `done` | Add unit tests for service contracts and persistence.
Owner: QA/Test Agent
Control: Product Agent

- [ ] Status: `todo` | Add snapshot tests for key screens and overlays.
Owner: QA/Test Agent
Control: Product Agent

- [ ] Status: `todo` | Run manual regression checklist on simulator.
Owner: QA/Test Agent
Control: Product Agent

## Phase 6: Release Readiness
- [ ] Status: `todo` | Performance pass (frame pacing, spikes, memory).
Owner: iOS Architect Agent
Control: Product Agent

- [ ] Status: `todo` | Onboarding and final UX polish.
Owner: UI Agent
Control: Product Agent

- [ ] Status: `todo` | TestFlight build and external feedback cycle.
Owner: Product Agent
Control: Product Agent

- [ ] Status: `todo` | Release checklist and App Store submission prep.
Owner: Product Agent
Control: Product Agent

## Execution Rules
1. No implementation starts without acceptance criteria.
2. Each phase ends with a gate review by Product Agent.
3. Scope changes require returning to Phase 0/1 decision.
4. Any architecture violation is escalated to iOS Architect gate.
