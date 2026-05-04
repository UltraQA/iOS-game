# Manual Regression Report
Date: 2026-05-04
Environment: iPhone 17 Simulator (iOS 26.4.1)
Build: iOSGame (Debug)

## Checklist
- Launch flow: PASS
- Home -> Continue/Play: PASS
- Gameplay HUD visibility: PASS
- Pause overlay (Resume/Restart/Home): PASS
- Restart from pause returns gameplay state: PASS
- Fail state trigger and fail flow: PASS (fixed during test run)
- Progress updates during run: PASS

## Findings During Run
1. Player could occasionally stick on obstacle without entering failed state.
- Resolution: added fallback frame-intersection fail guard in `PlatformerScene.update(_:)`.

## Residual Risk
- Completion + Next chain was not exhaustively replayed across all Easy levels in this pass.
