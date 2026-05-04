# Agent Execution Plan

## Responsibility Model
- `Owner`: agent that executes the task.
- `Control`: Product agent validates scope, acceptance criteria, and completion quality.

## Phase 0: Discovery and Product Direction
1. Define theme candidates (3 options) and pick one.
- Owner: Product Agent
- Control: Product Agent

2. Define UX pillars (speed, readability, retry friction).
- Owner: Product Agent
- Control: Product Agent

3. Freeze MVP scope and out-of-scope list.
- Owner: Product Agent
- Control: Product Agent

## Phase 1: Architecture and Technical Design
1. Finalize module boundaries and data flow.
- Owner: iOS Architect Agent
- Control: Product Agent

2. Finalize gameplay state machine and transition rules.
- Owner: iOS Architect Agent
- Control: Product Agent

3. Define level data contract (`LevelConfig`, difficulty tier policy).
- Owner: iOS Architect Agent
- Control: Product Agent

4. Define performance budget and technical constraints.
- Owner: iOS Architect Agent
- Control: Product Agent

## Phase 2: Gameplay Core Implementation
1. Implement player controller (run/jump/ground detection).
- Owner: Gameplay Engineer Agent
- Control: Product Agent

2. Implement obstacle system and collision outcomes.
- Owner: Gameplay Engineer Agent
- Control: Product Agent

3. Implement finish gate and level completion logic.
- Owner: Gameplay Engineer Agent
- Control: Product Agent

4. Implement fail/retry loop under 1 second restart time.
- Owner: Gameplay Engineer Agent
- Control: Product Agent

5. Integrate haptics and basic SFX feedback.
- Owner: Gameplay Engineer Agent
- Control: Product Agent

## Phase 3: UI and UX Implementation
1. Implement Home, Tier Select, Level Select screens.
- Owner: UI Agent
- Control: Product Agent

2. Implement Gameplay HUD (meter, attempts, pause).
- Owner: UI Agent
- Control: Product Agent

3. Implement Pause/Fail/Complete overlays.
- Owner: UI Agent
- Control: Product Agent

4. Apply design tokens and component consistency checks.
- Owner: UI Agent
- Control: Product Agent

## Phase 4: Progression and Persistence
1. Implement level unlock progression per tier.
- Owner: Gameplay Engineer Agent
- Control: Product Agent

2. Implement persistent save for best score/stars/unlocks.
- Owner: iOS Architect Agent
- Control: Product Agent

3. Implement continue-from-last-level behavior.
- Owner: Gameplay Engineer Agent
- Control: Product Agent

## Phase 5: QA and Test Coverage
1. Add unit tests for state transitions and progression rules.
- Owner: QA/Test Agent
- Control: Product Agent

2. Add unit tests for service contracts and persistence.
- Owner: QA/Test Agent
- Control: Product Agent

3. Add snapshot tests for key screens and overlays.
- Owner: QA/Test Agent
- Control: Product Agent

4. Run manual regression checklist on simulator.
- Owner: QA/Test Agent
- Control: Product Agent

## Phase 6: Release Readiness
1. Performance pass (frame pacing, spikes, memory).
- Owner: iOS Architect Agent
- Control: Product Agent

2. Onboarding and final UX polish.
- Owner: UI Agent
- Control: Product Agent

3. TestFlight build and external feedback cycle.
- Owner: Product Agent
- Control: Product Agent

4. Release checklist and App Store submission prep.
- Owner: Product Agent
- Control: Product Agent

## Execution Rules
1. No implementation starts without acceptance criteria.
2. Each phase ends with a gate review by Product Agent.
3. Scope changes require returning to Phase 0/1 decision.
4. Any architecture violation is escalated to iOS Architect gate.
