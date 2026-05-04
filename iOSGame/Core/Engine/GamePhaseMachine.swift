import Foundation

enum GameEvent {
    case start
    case pause
    case resume
    case fail
    case complete
    case restart
}

struct GamePhaseMachine {
    private(set) var phase: GamePhase = .idle

    mutating func handle(_ event: GameEvent) {
        switch (phase, event) {
        case (.idle, .start):
            phase = .running
        case (.running, .pause):
            phase = .paused
        case (.paused, .resume):
            phase = .running
        case (.running, .fail):
            phase = .gameOver
        case (.running, .complete):
            phase = .gameOver
        case (.gameOver, .restart):
            phase = .running
        default:
            break
        }
    }
}
