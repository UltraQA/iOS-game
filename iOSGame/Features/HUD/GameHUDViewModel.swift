import Foundation

@MainActor
final class GameHUDViewModel {
    private let environment: AppEnvironment
    private(set) var state = GameState()

    init(environment: AppEnvironment) {
        self.environment = environment
    }

    func startGame() {
        state.phase = .running
        state.score = 0
        state.remainingSeconds = 60
    }

    func registerTapScore(_ points: Int = 1) {
        guard state.phase == .running else { return }
        state.score += points
        environment.audioPlayer.playTap()
        environment.haptics.impactLight()
    }

    func finishGame() async {
        state.phase = .gameOver
        if state.score > state.bestScore {
            state.bestScore = state.score
            try? await environment.scoreStorage.saveBestScore(state.bestScore)
            environment.haptics.notifySuccess()
        } else {
            environment.haptics.notifyError()
        }
        environment.audioPlayer.playGameOver()
    }

    func loadBestScore() async {
        state.bestScore = (try? await environment.scoreStorage.fetchBestScore()) ?? 0
    }
}
