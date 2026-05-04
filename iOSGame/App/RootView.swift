import SwiftUI

struct RootView: View {
    @StateObject private var viewModel: RootViewModel

    init(viewModel: RootViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        switch viewModel.route {
        case .home:
            HomeView(onPlay: viewModel.startEasyLevel1)
        case .gameplay(let level):
            GameplayContainerView(level: level, onFinish: viewModel.finish)
        case .result(let result):
            ResultView(result: result, onRetry: viewModel.startEasyLevel1, onHome: viewModel.goHome)
        }
    }
}
