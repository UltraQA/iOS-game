import SwiftUI
import XCTest

class SnapshotTestCase: XCTestCase {
    var recordSnapshots: Bool {
        ProcessInfo.processInfo.environment["RECORD_SNAPSHOTS"] == "1"
    }

    func assertSnapshot<V: View>(
        _ view: V,
        named name: String,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        let controller = UIHostingController(rootView: view)
        controller.view.frame = CGRect(x: 0, y: 0, width: 390, height: 844)
        controller.view.backgroundColor = .systemBackground

        let renderer = UIGraphicsImageRenderer(size: controller.view.bounds.size)
        let image = renderer.image { _ in
            controller.view.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }

        let testFilePath = URL(fileURLWithPath: "\(file)")
        let snapshotsDir = testFilePath
            .deletingLastPathComponent() // Snapshots
            .appendingPathComponent("Reference", isDirectory: true)

        let referenceURL = snapshotsDir.appendingPathComponent("\(name).png")

        if recordSnapshots {
            try? FileManager.default.createDirectory(at: snapshotsDir, withIntermediateDirectories: true)
            guard let data = image.pngData() else {
                return XCTFail("Failed to encode PNG", line: line)
            }
            try? data.write(to: referenceURL)
            XCTFail("Recorded snapshot for \(name). Re-run without RECORD_SNAPSHOTS=1.", line: line)
            return
        }

        guard let referenceData = try? Data(contentsOf: referenceURL),
              let currentData = image.pngData() else {
            return XCTFail("Missing snapshot reference: \(referenceURL.path). Run with RECORD_SNAPSHOTS=1", line: line)
        }

        XCTAssertEqual(currentData, referenceData, "Snapshot mismatch: \(name)", line: line)
    }
}
