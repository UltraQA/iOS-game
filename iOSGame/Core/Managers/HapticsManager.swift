import UIKit

final class HapticsManager: HapticsProviding {
    func impactLight() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
    }

    func impactSoft() {
        UIImpactFeedbackGenerator(style: .soft).impactOccurred()
    }

    func notifySuccess() {
        UINotificationFeedbackGenerator().notificationOccurred(.success)
    }

    func notifyError() {
        UINotificationFeedbackGenerator().notificationOccurred(.error)
    }
}
