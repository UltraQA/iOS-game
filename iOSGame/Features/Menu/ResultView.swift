import SwiftUI

struct ResultView: View {
    let result: GameResult
    let onRetry: () -> Void
    let onHome: () -> Void

    var body: some View {
        VStack(spacing: 14) {
            Text(result.completed ? "Level Complete" : "Level Failed")
                .font(.system(size: 28, weight: .bold, design: .rounded))

            Text("Score: \(result.score)%")
                .font(.title3)

            Button("Retry", action: onRetry)
                .buttonStyle(.borderedProminent)

            Button("Home", action: onHome)
                .buttonStyle(.bordered)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(24)
        .background(Color(.systemBackground))
    }
}
