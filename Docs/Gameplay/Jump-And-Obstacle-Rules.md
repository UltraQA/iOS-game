# Jump and Obstacle Rules

## Implemented Rules
- Jump apex height target is fixed and equals character height.
- Single obstacle height must not exceed character jump-clear readability target.
- Harder sections are built via obstacle sequences (multi-jump combos), not taller obstacles.

## Practical Mapping
- Character height: `GameplayTuning.characterSize.height`
- Target jump height: `GameplayTuning.jumpHeight == character height`
- Obstacle max height: `GameplayTuning.obstacleHeight <= character height`
- Multi-jump section: `pattern` values in `LevelConfig.makeObstacleCourse`

## Why this model
- Predictable controls and fair difficulty curve.
- Easier balancing by spacing and sequence length.
- Better readability for players than sudden oversized obstacles.
