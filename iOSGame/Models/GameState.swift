import Foundation

enum GamePhase: Equatable {
    case idle
    case running
    case paused
    case gameOver
}

struct GameState: Equatable {
    var phase: GamePhase = .idle
    var score: Int = 0
    var bestScore: Int = 0
    var remainingSeconds: Int = 60
}
