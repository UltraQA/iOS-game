import Foundation

@MainActor
final class RootViewModel: ObservableObject {
    @Published private(set) var route: RootRoute = .home

    func startEasyLevel1() {
        route = .gameplay(.easy1)
    }

    func finish(result: GameResult) {
        route = .result(result)
    }

    func goHome() {
        route = .home
    }
}
