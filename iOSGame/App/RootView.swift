import SwiftUI

struct RootView: View {
    @StateObject private var viewModel: RootViewModel

    init(viewModel: RootViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        switch viewModel.route {
        case .home:
            HomeView(onPlay: viewModel.openLevelSelect)
        case .levelSelect:
            LevelSelectView(onSelectLevel: viewModel.start(level:), onBack: viewModel.goHome)
        case .gameplay(let level):
            GameplayContainerView(level: level, onExitHome: viewModel.goHome)
        }
    }
}
