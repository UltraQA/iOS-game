import XCTest
@testable import iOSGame

final class GamePhaseMachineTests: XCTestCase {
    func test_startFromIdle_movesToRunning() {
        var machine = GamePhaseMachine()

        machine.handle(.start)

        XCTAssertEqual(machine.phase, .running)
    }

    func test_failFromRunning_movesToGameOver() {
        var machine = GamePhaseMachine()
        machine.handle(.start)

        machine.handle(.fail)

        XCTAssertEqual(machine.phase, .gameOver)
    }

    func test_restartFromGameOver_movesToRunning() {
        var machine = GamePhaseMachine()
        machine.handle(.start)
        machine.handle(.fail)

        machine.handle(.restart)

        XCTAssertEqual(machine.phase, .running)
    }
}
