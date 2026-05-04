import SwiftUI

struct RootView: View {
    @StateObject private var viewModel: RootViewModel

    init(viewModel: RootViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        switch viewModel.route {
        case .home:
            HomeView(
                canContinue: viewModel.canContinue(),
                onContinue: viewModel.continueLastLevel,
                onPlay: viewModel.openLevelSelect
            )
        case .levelSelect:
            LevelSelectView(
                levels: LevelConfig.easyTier,
                isUnlocked: { viewModel.isUnlocked($0.id) },
                onSelectLevel: viewModel.start(level:),
                onBack: viewModel.goHome
            )
        case .gameplay(let level):
            GameplayContainerView(
                level: level,
                onCompleted: { levelID in
                    viewModel.complete(levelID: levelID)
                },
                onNextLevel: { current in
                    if let next = LevelConfig.nextLevel(after: current), viewModel.isUnlocked(next.id) {
                        viewModel.start(level: next)
                    } else {
                        viewModel.openLevelSelect()
                    }
                },
                onExitHome: viewModel.goHome
            )
        }
    }
}
