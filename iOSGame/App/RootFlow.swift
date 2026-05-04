import Foundation

enum RootRoute: Equatable {
    case home
    case gameplay(LevelConfig)
    case result(GameResult)
}

struct GameResult: Equatable {
    let levelID: LevelID
    let score: Int
    let completed: Bool
}
