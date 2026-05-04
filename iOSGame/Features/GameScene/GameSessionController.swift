import CoreGraphics
import Foundation

@MainActor
final class GameSessionController {
    private(set) var state: GameState
    private(set) var level: LevelConfig

    private var phaseMachine = GamePhaseMachine()

    init(level: LevelConfig, bestScore: Int = 0) {
        self.level = level
        self.state = GameState(phase: .idle, score: 0, bestScore: bestScore, remainingSeconds: 60)
    }

    func start() {
        phaseMachine.handle(.start)
        state.phase = phaseMachine.phase
        state.score = 0
        state.remainingSeconds = 60
    }

    func updateProgress(playerX: CGFloat) {
        guard state.phase == .running else { return }
        let progress = max(0, min(playerX / level.finishX, 1))
        state.score = Int(progress * 100)
    }

    func fail() {
        phaseMachine.handle(.fail)
        state.phase = phaseMachine.phase
    }

    func complete() {
        phaseMachine.handle(.complete)
        state.phase = phaseMachine.phase
        if state.score > state.bestScore {
            state.bestScore = state.score
        }
    }

    func restart() {
        phaseMachine.handle(.restart)
        state.phase = phaseMachine.phase
        state.score = 0
        state.remainingSeconds = 60
    }
}
