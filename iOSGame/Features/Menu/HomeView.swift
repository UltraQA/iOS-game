import SwiftUI

struct HomeView: View {
    let canContinue: Bool
    let onContinue: () -> Void
    let onPlay: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            Text("One Tap Platformer")
                .font(.system(size: 32, weight: .bold, design: .rounded))

            Text("Jump with timing. Reach the finish gate.")
                .font(.headline)
                .foregroundStyle(.secondary)

            if canContinue {
                Button("Continue", action: onContinue)
                    .buttonStyle(.bordered)
                    .controlSize(.large)
            }

            Button("Play", action: onPlay)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(24)
        .background(Color(.systemGroupedBackground))
    }
}
