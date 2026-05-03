import UIKit

final class HapticsManager: HapticsProviding {
    func impactLight() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
    }

    func notifySuccess() {
        UINotificationFeedbackGenerator().notificationOccurred(.success)
    }

    func notifyError() {
        UINotificationFeedbackGenerator().notificationOccurred(.error)
    }
}
