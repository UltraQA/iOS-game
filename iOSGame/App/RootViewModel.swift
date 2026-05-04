import Foundation

@MainActor
final class RootViewModel: ObservableObject {
    @Published private(set) var route: RootRoute = .home

    func openLevelSelect() {
        route = .levelSelect
    }

    func start(level: LevelConfig) {
        route = .gameplay(level)
    }

    func goHome() {
        route = .home
    }
}
