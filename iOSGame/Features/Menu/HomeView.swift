import SwiftUI

struct HomeView: View {
    let onPlay: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            Text("One Tap Platformer")
                .font(.system(size: 32, weight: .bold, design: .rounded))

            Text("Easy-1")
                .font(.headline)
                .foregroundStyle(.secondary)

            Button("Play", action: onPlay)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(24)
        .background(Color(.systemGroupedBackground))
    }
}
