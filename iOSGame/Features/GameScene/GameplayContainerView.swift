import SpriteKit
import SwiftUI

struct GameplayContainerView: View {
    let level: LevelConfig
    let onFinish: (GameResult) -> Void

    @State private var score: Int = 0
    @State private var scene: SKScene

    init(level: LevelConfig, onFinish: @escaping (GameResult) -> Void) {
        self.level = level
        self.onFinish = onFinish

        let controller = GameSessionController(level: level)
        let bootScene = PlatformerScene(
            size: CGSize(width: 390, height: 844),
            controller: controller,
            onFinish: { completed, finalScore in
                onFinish(GameResult(levelID: level.id, score: finalScore, completed: completed))
            }
        )
        _scene = State(initialValue: bootScene)
    }

    var body: some View {
        ZStack(alignment: .top) {
            SpriteView(scene: scene)
                .ignoresSafeArea()

            HUDView(score: score)
                .padding(.top, 12)
                .padding(.horizontal, 16)
        }
        .onAppear {
            if let platformer = scene as? PlatformerScene {
                platformer.setProgressListener { value in
                    score = value
                }
            }
        }
        .background(.black)
    }
}

private struct HUDView: View {
    let score: Int

    var body: some View {
        HStack {
            Text("Progress: \(score)%")
                .font(.headline)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(.ultraThinMaterial, in: Capsule())

            Spacer()
        }
    }
}
