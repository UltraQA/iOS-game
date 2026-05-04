# Production Sequence (Role-Gated)

## Mandatory Order
1. Product Agent: idea, theme, style, UX goals, scope gate.
2. iOS Architect: architecture decision and module contract gate.
3. Gameplay + UI: implementation of mechanics and interface gate.
4. QA/Test: unit + snapshot + manual regression gate.

## Gate Policy
- Next stage cannot start until previous stage has written acceptance criteria.
- Any scope increase returns task to Product gate.
- Any architecture breach returns task to Architect gate.

## Sprint Rhythm
- Daily: implementation updates.
- Every 2 days: quality gate review.
- End of sprint: playable build + test report.
