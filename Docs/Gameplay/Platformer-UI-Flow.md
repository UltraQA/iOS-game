# Platformer UI Flow and Screen Structure

## Screen Map
1. Home
2. Tier Select
3. Level Select
4. Gameplay
5. Pause Overlay
6. Fail Overlay
7. Level Complete Overlay

## Home
- Primary CTA: Play
- Secondary: Settings
- Optional: Continue last unlocked level

## Tier Select
- Easy / Medium / Hard cards
- Locked tiers visually disabled with requirement text

## Level Select
- 3 levels per tier displayed as cards
- Card shows best result and stars
- Locked levels show lock icon

## Gameplay HUD
- Top left: attempt count or lives (MVP attempts)
- Top center: progress meter (0-100%)
- Top right: pause button

## Overlays
- Pause: Resume / Restart / Exit
- Fail: Retry (primary) / Exit
- Complete: Next Level (primary) / Replay / Exit

## UI Component Mapping (SwiftUI)
- `PrimaryButtonStyle`
- `SecondaryButtonStyle`
- `ProgressMeterView`
- `TierCardView`
- `LevelCardView`
- `ResultOverlayView`
