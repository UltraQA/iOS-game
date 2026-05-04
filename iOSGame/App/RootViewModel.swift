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
        route = .gameplay(level)
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
