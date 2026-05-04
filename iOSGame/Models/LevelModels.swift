import CoreGraphics
import Foundation

struct LevelID: Hashable, Codable {
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
}
