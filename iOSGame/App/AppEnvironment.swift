import Foundation

protocol ScoreStorage {
    func fetchBestScore() async throws -> Int
    func saveBestScore(_ score: Int) async throws
}

protocol AudioPlaying {
    func playTap()
    func playGameOver()
    func playSuccess()
    func playPause()
}

protocol HapticsProviding {
    func impactLight()
    func notifySuccess()
    func notifyError()
    func impactSoft()
}

struct AppEnvironment {
    let scoreStorage: ScoreStorage
    let audioPlayer: AudioPlaying
    let haptics: HapticsProviding
}
