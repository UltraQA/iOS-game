import CoreGraphics
import Foundation

struct LevelID: Hashable, Codable, Equatable {
    let tier: DifficultyTier
    let index: Int
}

enum DifficultyTier: String, Codable, CaseIterable {
    case easy
    case medium
    case hard
}

struct LevelConfig: Codable, Equatable {
    let id: LevelID
    let runSpeed: CGFloat
    let gravity: CGFloat
    let finishX: CGFloat
    let obstacleRects: [CGRect]

    static let easy1 = LevelConfig(
        id: LevelID(tier: .easy, index: 1),
        runSpeed: 220,
        gravity: GameplayTuning.gravity,
        finishX: 2200,
        obstacleRects: makeObstacleCourse(baseX: 520, pattern: [1, 1, 1])
    )

    static let easy2 = LevelConfig(
        id: LevelID(tier: .easy, index: 2),
        runSpeed: 240,
        gravity: GameplayTuning.gravity,
        finishX: 2450,
        obstacleRects: makeObstacleCourse(baseX: 500, pattern: [1, 2, 1, 2])
    )

    static let easy3 = LevelConfig(
        id: LevelID(tier: .easy, index: 3),
        runSpeed: 260,
        gravity: GameplayTuning.gravity,
        finishX: 2700,
        obstacleRects: makeObstacleCourse(baseX: 480, pattern: [2, 2, 1, 2, 2])
    )

    static var easyTier: [LevelConfig] {
        [.easy1, .easy2, .easy3]
    }

    static func level(for id: LevelID) -> LevelConfig? {
        guard id.tier == .easy else { return nil }
        switch id.index {
        case 1: return .easy1
        case 2: return .easy2
        case 3: return .easy3
        default: return nil
        }
    }

    static func nextLevel(after id: LevelID) -> LevelConfig? {
        guard id.tier == .easy else { return nil }
        switch id.index {
        case 1: return .easy2
        case 2: return .easy3
        default: return nil
        }
    }

    // pattern values represent how many consecutive jumps are required in that segment.
    private static func makeObstacleCourse(baseX: CGFloat, pattern: [Int]) -> [CGRect] {
        var rects: [CGRect] = []
        var x = baseX

        for jumpCount in pattern {
            for jumpIndex in 0..<jumpCount {
                rects.append(
                    CGRect(
                        x: x,
                        y: 0,
                        width: GameplayTuning.obstacleWidth,
                        height: GameplayTuning.obstacleHeight
                    )
                )
                x += jumpIndex == jumpCount - 1 ? GameplayTuning.obstacleSpacing : GameplayTuning.comboSpacing
            }
        }

        return rects
    }
}
