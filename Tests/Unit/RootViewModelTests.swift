import XCTest
@testable import iOSGame

@MainActor
final class RootViewModelTests: XCTestCase {
    func test_continueFallsBackToEasy1WhenNoLastLevel() {
        let store = MockProgressionStore(unlocked: [1], lastPlayed: nil)
        let vm = RootViewModel(progressionStore: store)

        vm.continueLastLevel()

        guard case .gameplay(let level) = vm.route else {
            return XCTFail("Expected gameplay route")
        }
        XCTAssertEqual(level.id, LevelID(tier: .easy, index: 1))
    }

    func test_completeUnlocksNextLevel() {
        let store = MockProgressionStore(unlocked: [1], lastPlayed: nil)
        let vm = RootViewModel(progressionStore: store)

        vm.complete(levelID: LevelID(tier: .easy, index: 1))

        XCTAssertTrue(store.unlocked.contains(2))
    }
}

private final class MockProgressionStore: ProgressionStoring {
    var unlocked: Set<Int>
    var lastPlayed: LevelID?

    init(unlocked: Set<Int>, lastPlayed: LevelID?) {
        self.unlocked = unlocked
        self.lastPlayed = lastPlayed
    }

    func unlockedLevelIndices(for tier: DifficultyTier) -> Set<Int> {
        unlocked
    }

    func unlock(_ levelID: LevelID) {
        unlocked.insert(levelID.index)
    }

    func saveLastPlayedLevel(_ levelID: LevelID) {
        lastPlayed = levelID
    }

    func lastPlayedLevel() -> LevelID? {
        lastPlayed
    }

    func reset() {
        unlocked = [1]
        lastPlayed = nil
    }
}
