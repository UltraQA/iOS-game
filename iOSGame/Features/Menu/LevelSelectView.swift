import SwiftUI

struct LevelSelectView: View {
    let levels: [LevelConfig]
    let isUnlocked: (LevelConfig) -> Bool
    let onSelectLevel: (LevelConfig) -> Void
    let onBack: () -> Void

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 14) {
                Text("Easy")
                    .font(.title2.weight(.bold))

                ForEach(levels, id: \.id) { level in
                    let unlocked = isUnlocked(level)
                    LevelRow(
                        title: "Level \(level.id.index)",
                        unlocked: unlocked,
                        action: { onSelectLevel(level) }
                    )
                }

                Spacer()
            }
            .padding(20)
            .navigationTitle("Select Level")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Back", action: onBack)
                }
            }
        }
    }
}

private struct LevelRow: View {
    let title: String
    let unlocked: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                Spacer()
                Image(systemName: unlocked ? "play.fill" : "lock.fill")
            }
            .padding(14)
            .background(unlocked ? Color.blue.opacity(0.15) : Color.gray.opacity(0.18))
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        }
        .buttonStyle(.plain)
        .disabled(!unlocked)
        .opacity(unlocked ? 1.0 : 0.6)
    }
}
