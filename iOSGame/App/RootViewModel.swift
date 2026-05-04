import Foundation

@MainActor
final class RootViewModel: ObservableObject {
    @Published private(set) var route: RootRoute = .home

    private let progressionStore: ProgressionStoring

    init(progressionStore: ProgressionStoring = UserDefaultsProgressionStore()) {
        self.progressionStore = progressionStore
    }

    func openLevelSelect() {
        route = .levelSelect
    }

    func start(level: LevelConfig) {
        progressionStore.saveLastPlayedLevel(level.id)
        route = .gameplay(level)
    }

    func continueLastLevel() {
        guard let levelID = progressionStore.lastPlayedLevel(),
              isUnlocked(levelID),
              let level = LevelConfig.level(for: levelID) else {
            start(level: .easy1)
            return
        }
        start(level: level)
    }

    func canContinue() -> Bool {
        guard let levelID = progressionStore.lastPlayedLevel() else { return false }
        return isUnlocked(levelID)
    }

    func complete(levelID: LevelID) {
        if let next = LevelConfig.nextLevel(after: levelID) {
            progressionStore.unlock(next.id)
        }
    }

    func isUnlocked(_ levelID: LevelID) -> Bool {
        progressionStore.unlockedLevelIndices(for: levelID.tier).contains(levelID.index)
    }

    func goHome() {
        route = .home
    }
}
