# iOS Design System (v1)

## 1) Color Tokens

### Semantic
- `color.background.primary` = `#F6F7FB`
- `color.background.secondary` = `#FFFFFF`
- `color.surface.card` = `#FFFFFF`
- `color.brand.primary` = `#1D4ED8`
- `color.brand.secondary` = `#0EA5E9`
- `color.accent.success` = `#16A34A`
- `color.accent.warning` = `#EA580C`
- `color.accent.danger` = `#DC2626`
- `color.text.primary` = `#0F172A`
- `color.text.secondary` = `#475569`
- `color.text.inverse` = `#FFFFFF`
- `color.border.default` = `#E2E8F0`

### SwiftUI Mapping
- `Color("BackgroundPrimary")`
- `Color("BrandPrimary")`
- `Color("TextPrimary")`

## 2) Typography Scale

- `type.display.large` = 34 / semibold
- `type.title.1` = 28 / semibold
- `type.title.2` = 22 / semibold
- `type.headline` = 17 / semibold
- `type.body` = 17 / regular
- `type.body.small` = 15 / regular
- `type.caption` = 13 / medium

SwiftUI style:
- `.font(.system(size: 17, weight: .regular, design: .rounded))`

## 3) Spacing System

Base unit: 4pt
- `space.1` = 4
- `space.2` = 8
- `space.3` = 12
- `space.4` = 16
- `space.5` = 20
- `space.6` = 24
- `space.8` = 32
- `space.10` = 40

## 4) Core Components (Mapped to SwiftUI)

- Primary Button: `Button` + capsule background + pressed scale animation
- Secondary Button: outlined style
- HUD Badge: rounded rectangle with icon + numeric text
- Score Counter: large monospace digits
- Pause Modal: card container + two action buttons
- Game Over Sheet: score, best score, restart CTA

## 5) Screen Layouts

### Home
- Title
- Play button
- Small settings icon button

### Gameplay
- Top HUD (score, timer)
- Center gameplay area (SpriteKit scene)
- Bottom action area (optional booster)

### Pause
- Resume
- Restart
- Exit to Home

### Game Over
- Final score
- Best score
- Restart primary button
- Home secondary button
