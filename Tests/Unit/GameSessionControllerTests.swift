import CoreGraphics
import XCTest
@testable import iOSGame

@MainActor
final class GameSessionControllerTests: XCTestCase {
    func test_progressUpdatesScoreToPercent() {
        let controller = GameSessionController(level: .easy1)
        controller.start()

        controller.updateProgress(playerX: controller.level.finishX * 0.65)

        XCTAssertEqual(controller.state.score, 65)
    }

    func test_completeUpdatesBestScore() {
        let controller = GameSessionController(level: .easy1, bestScore: 40)
        controller.start()
        controller.updateProgress(playerX: controller.level.finishX)

        controller.complete()

        XCTAssertEqual(controller.state.bestScore, 100)
        XCTAssertEqual(controller.state.phase, .gameOver)
    }

    func test_failMovesToGameOver() {
        let controller = GameSessionController(level: .easy1)
        controller.start()

        controller.fail()

        XCTAssertEqual(controller.state.phase, .gameOver)
    }
}
