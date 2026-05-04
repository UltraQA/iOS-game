# Platformer Gameplay Spec (MVP)

## Core Loop
1. Player starts level.
2. Auto-run moves character forward at tuned speed.
3. Player taps to jump over obstacles and gaps.
4. Collision with hazard triggers fail and instant retry option.
5. Reaching finish gate completes level and updates progression.

## Controls
- Single tap: jump.
- Optional buffered tap window: 80-120ms to improve feel.
- Optional coyote time: 80ms after leaving edge.

## Character Behavior
- Constant horizontal velocity.
- Vertical movement via tuned jump impulse + gravity.
- Prevent double jump in MVP (unless level mechanic requires).

## Obstacles and World
- Hazard types: spike, moving block (later), gap.
- Static level geometry for MVP (handcrafted).
- Checkpoint system excluded from first iteration (full retry).

## Difficulty Tiers
- Easy: slower speed, wider jump windows, fewer chained hazards.
- Medium: baseline speed and tighter spacing.
- Hard: faster speed, tighter timings, mixed obstacle sequences.

## Completion and Motivation
- Primary completion: reach finish gate.
- Secondary motivation: progress meter fills to 100% while moving.
- Optional performance grade: 1-3 stars from attempts and clear time.

## Failure/Retry UX
- On fail: freeze 200-300ms, show hit feedback, haptic error.
- Show compact overlay with `Retry` (primary) and `Exit` (secondary).
- Retry should restart in <= 1 second.

## Balancing Parameters (initial)
- Base run speed: 220 pt/s (easy), 260 (medium), 300 (hard)
- Jump impulse: tune to clear 1.2x standard obstacle height
- Gravity: target jump arc around 0.55-0.70s total airtime
