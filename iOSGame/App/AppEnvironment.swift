import Foundation

protocol ScoreStorage {
    func fetchBestScore() async throws -> Int
    func saveBestScore(_ score: Int) async throws
}

protocol AudioPlaying {
    func playTap()
    func playGameOver()
}

protocol HapticsProviding {
    func impactLight()
    func notifySuccess()
    func notifyError()
}

struct AppEnvironment {
    let scoreStorage: ScoreStorage
    let audioPlayer: AudioPlaying
    let haptics: HapticsProviding
}
