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
    let jumpImpulse: CGFloat
    let gravity: CGFloat
    let finishX: CGFloat
    let obstacleRects: [CGRect]

    static let easy1 = LevelConfig(
        id: LevelID(tier: .easy, index: 1),
        runSpeed: 220,
        jumpImpulse: 390,
        gravity: -980,
        finishX: 2200,
        obstacleRects: [
            CGRect(x: 550, y: 0, width: 40, height: 80),
            CGRect(x: 980, y: 0, width: 50, height: 95),
            CGRect(x: 1410, y: 0, width: 55, height: 110)
        ]
    )

    static let easy2 = LevelConfig(
        id: LevelID(tier: .easy, index: 2),
        runSpeed: 240,
        jumpImpulse: 395,
        gravity: -1000,
        finishX: 2400,
        obstacleRects: [
            CGRect(x: 520, y: 0, width: 44, height: 82),
            CGRect(x: 900, y: 0, width: 54, height: 98),
            CGRect(x: 1280, y: 0, width: 58, height: 114),
            CGRect(x: 1710, y: 0, width: 62, height: 118)
        ]
    )

    static let easy3 = LevelConfig(
        id: LevelID(tier: .easy, index: 3),
        runSpeed: 260,
        jumpImpulse: 400,
        gravity: -1020,
        finishX: 2600,
        obstacleRects: [
            CGRect(x: 510, y: 0, width: 46, height: 88),
            CGRect(x: 860, y: 0, width: 56, height: 106),
            CGRect(x: 1210, y: 0, width: 60, height: 118),
            CGRect(x: 1560, y: 0, width: 64, height: 124),
            CGRect(x: 1960, y: 0, width: 68, height: 128)
        ]
    )

    static var easyTier: [LevelConfig] {
        [.easy1, .easy2, .easy3]
    }

    static func nextLevel(after id: LevelID) -> LevelConfig? {
        guard id.tier == .easy else { return nil }
        switch id.index {
        case 1: return .easy2
        case 2: return .easy3
        default: return nil
        }
    }
}
