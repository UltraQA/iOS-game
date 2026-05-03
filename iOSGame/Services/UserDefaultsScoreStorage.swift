import Foundation

final class UserDefaultsScoreStorage: ScoreStorage {
    private let key = "best_score"

    func fetchBestScore() async throws -> Int {
        UserDefaults.standard.integer(forKey: key)
    }

    func saveBestScore(_ score: Int) async throws {
        UserDefaults.standard.set(score, forKey: key)
    }
}
