import XCTest
@testable import iOSGame

final class ProgressionStoreTests: XCTestCase {
    private var defaults: UserDefaults!
    private var store: UserDefaultsProgressionStore!

    override func setUp() {
        super.setUp()
        defaults = UserDefaults(suiteName: "ProgressionStoreTests")
        defaults.removePersistentDomain(forName: "ProgressionStoreTests")
        store = UserDefaultsProgressionStore(defaults: defaults)
    }

    override func tearDown() {
        defaults.removePersistentDomain(forName: "ProgressionStoreTests")
        defaults = nil
        store = nil
        super.tearDown()
    }

    func test_seedUnlocksEasyLevelOne() {
        XCTAssertTrue(store.unlockedLevelIndices(for: .easy).contains(1))
    }

    func test_unlockAddsLevel() {
        store.unlock(LevelID(tier: .easy, index: 2))

        let unlocked = store.unlockedLevelIndices(for: .easy)
        XCTAssertTrue(unlocked.contains(1))
        XCTAssertTrue(unlocked.contains(2))
    }

    func test_saveAndRestoreLastPlayedLevel() {
        let id = LevelID(tier: .easy, index: 3)
        store.saveLastPlayedLevel(id)

        XCTAssertEqual(store.lastPlayedLevel(), id)
    }
}
