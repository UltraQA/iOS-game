import SpriteKit
import SwiftUI

private enum RunOverlayState {
    case none
    case paused
    case failed
    case completed
}

struct GameplayContainerView: View {
    let level: LevelConfig
    let onExitHome: () -> Void

    @State private var score: Int = 0
    @State private var scene: SKScene
    @State private var overlay: RunOverlayState = .none

    init(level: LevelConfig, onExitHome: @escaping () -> Void) {
        self.level = level
        self.onExitHome = onExitHome
        _scene = State(initialValue: GameplayContainerView.makeScene(level: level, score: .constant(0), overlay: .constant(.none)))
    }

    var body: some View {
        ZStack(alignment: .top) {
            SpriteView(scene: scene)
                .ignoresSafeArea()

            HUDView(score: score, onPause: pauseTapped)
                .padding(.top, 12)
                .padding(.horizontal, 16)

            if overlay != .none {
                OverlayCard(
                    state: overlay,
                    onResume: resumeTapped,
                    onRetry: retryTapped,
                    onNext: retryTapped,
                    onHome: onExitHome
                )
            }
        }
        .background(.black)
        .onAppear {
            attachSceneListeners()
        }
    }

    private func pauseTapped() {
        guard overlay == .none else { return }
        if let platformer = scene as? PlatformerScene {
            platformer.pauseGameplay()
            overlay = .paused
        }
    }

    private func resumeTapped() {
        if let platformer = scene as? PlatformerScene {
            platformer.resumeGameplay()
            overlay = .none
        }
    }

    private func retryTapped() {
        score = 0
        overlay = .none
        scene = GameplayContainerView.makeScene(level: level, score: $score, overlay: $overlay)
        attachSceneListeners()
    }

    private func attachSceneListeners() {
        if let platformer = scene as? PlatformerScene {
            platformer.setProgressListener { value in
                score = value
            }
        }
    }

    private static func makeScene(level: LevelConfig, score: Binding<Int>, overlay: Binding<RunOverlayState>) -> SKScene {
        let controller = GameSessionController(level: level)
        return PlatformerScene(
            size: CGSize(width: 390, height: 844),
            controller: controller,
            onFinish: { completed, finalScore in
                score.wrappedValue = finalScore
                overlay.wrappedValue = completed ? .completed : .failed
            }
        )
    }
}

private struct HUDView: View {
    let score: Int
    let onPause: () -> Void

    var body: some View {
        HStack {
            Text("Progress: \(score)%")
                .font(.headline)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(.ultraThinMaterial, in: Capsule())

            Spacer()

            Button(action: onPause) {
                Image(systemName: "pause.fill")
                    .foregroundStyle(.white)
                    .padding(10)
                    .background(.ultraThinMaterial, in: Circle())
            }
        }
    }
}

private struct OverlayCard: View {
    let state: RunOverlayState
    let onResume: () -> Void
    let onRetry: () -> Void
    let onNext: () -> Void
    let onHome: () -> Void

    var body: some View {
        ZStack {
            Color.black.opacity(0.35).ignoresSafeArea()

            VStack(spacing: 12) {
                Text(title)
                    .font(.title2.weight(.bold))

                if state == .paused {
                    Button("Resume", action: onResume).buttonStyle(.borderedProminent)
                    Button("Restart", action: onRetry).buttonStyle(.bordered)
                    Button("Home", action: onHome).buttonStyle(.bordered)
                } else if state == .failed {
                    Button("Retry", action: onRetry).buttonStyle(.borderedProminent)
                    Button("Home", action: onHome).buttonStyle(.bordered)
                } else {
                    Button("Next", action: onNext).buttonStyle(.borderedProminent)
                    Button("Replay", action: onRetry).buttonStyle(.bordered)
                    Button("Home", action: onHome).buttonStyle(.bordered)
                }
            }
            .padding(20)
            .frame(maxWidth: 280)
            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
    }

    private var title: String {
        switch state {
        case .paused:
            return "Paused"
        case .failed:
            return "Level Failed"
        case .completed:
            return "Level Complete"
        case .none:
            return ""
        }
    }
}
