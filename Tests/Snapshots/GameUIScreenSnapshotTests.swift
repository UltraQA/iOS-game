import SwiftUI
import XCTest
@testable import iOSGame

final class GameUIScreenSnapshotTests: SnapshotTestCase {
    @MainActor
    func test_homeView_snapshot() {
        let view = HomeView(
            canContinue: true,
            onContinue: {},
            onPlay: {}
        )
        assertSnapshot(view, named: "home_view")
    }

    @MainActor
    func test_levelSelectView_snapshot() {
        let view = LevelSelectView(
            levels: LevelConfig.easyTier,
            isUnlocked: { $0.id.index == 1 },
            onSelectLevel: { _ in },
            onBack: {}
        )
        assertSnapshot(view, named: "level_select_view")
    }
}
