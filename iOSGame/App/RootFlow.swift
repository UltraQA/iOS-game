import Foundation

enum RootRoute: Equatable {
    case home
    case levelSelect
    case gameplay(LevelConfig)
}
