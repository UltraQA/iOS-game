# Platformer MVP Product Plan

## Product Vision
Create a fast, satisfying one-tap platformer for iPhone where a character clears obstacles through short handcrafted levels and reaches a clear finish point.

## Target Player
- Casual mobile players
- Session length: 1-3 minutes
- Motivation: quick challenge, retry mastery, progression through difficulty tiers

## Core Value Proposition
- Instant start (no complexity)
- Tight controls
- High replayability through precise timing and short failures

## MVP Scope (must-have)
- One-tap control (jump)
- 3 difficulty tiers: Easy, Medium, Hard
- 9 levels total (3 per tier)
- Clear level completion condition (finish gate)
- Progress meter per level (0-100%)
- Retry flow under 2 taps
- Best time or best attempts per level

## Out of Scope (v1)
- Live ops
- Multiplayer
- Procedural generation
- Complex shop/economy

## Progression Logic
- Level completion unlocks next level
- Completing all 3 levels in tier unlocks next tier
- Optional stars (1-3) by performance (time/attempts)

## Success Metrics (internal)
- Tutorial completion > 85%
- D1 replay rate > 30%
- Avg session > 90 sec

## Production Phases
1. Pre-production (2-3 days): controls, camera, physics tuning target.
2. MVP implementation (7-10 days): full loop with 9 levels.
3. Polish (4-5 days): juice, haptics, onboarding, performance pass.
4. Soft launch prep: TestFlight + feedback iteration.

## Feature Backlog (ordered)
1. Player movement + jump feel
2. Obstacle collisions + restart loop
3. Level finish gate
4. HUD (meter, attempts, pause)
5. Level select + tier lock/unlock
6. Save progression
7. Juice pass (VFX/SFX/haptics)
