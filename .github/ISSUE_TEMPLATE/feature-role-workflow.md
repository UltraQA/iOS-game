---
name: Feature (5-role workflow)
about: Plan and deliver a feature using Product, Architecture, Gameplay, UI, and QA roles
title: "[Feature] "
labels: ["feature"]
assignees: []
---

## Feature Goal

Describe the feature in one sentence.

## 1) Product/Gameplay

### Core Loop Impact
- What changes in player experience?

### Acceptance Criteria
- [ ] AC1
- [ ] AC2
- [ ] AC3

### Out of Scope
- Explicitly list what will NOT be built now.

## 2) iOS Architecture

### Proposed Design
- Modules touched:
- New protocols/services:
- Data flow:

### Risks / Anti-pattern Watch
- Coupling risks:
- Lifecycle/state risks:
- Mitigation:

## 3) Gameplay Implementation

### Tasks
- [ ] Implement mechanic/state transitions
- [ ] Integrate with scene and managers
- [ ] Handle lose/restart flow

### Performance Notes
- Update-loop considerations:

## 4) UI/Design System

### Screens/Components
- [ ] Home/Menu
- [ ] HUD
- [ ] Game Over/Pause

### Design Token Mapping
Reference token names from `Docs/DesignSystem/DesignTokens.md`.

## 5) QA/Test

### Unit Tests
- [ ] State transition tests
- [ ] Service behavior tests

### Snapshot Tests
- [ ] Impacted screens/components

### Manual QA Checklist
- [ ] Launch flow
- [ ] Gameplay flow
- [ ] Pause/resume
- [ ] Game over/restart

## Definition of Done

- [ ] Playable on simulator
- [ ] Architecture checklist passed
- [ ] Tests are green
- [ ] PR checklist completed
