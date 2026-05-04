import CoreGraphics

enum GameplayTuning {
    static let characterSize = CGSize(width: 27, height: 36)
    static let jumpHeight: CGFloat = characterSize.height

    static let obstacleWidth: CGFloat = 30
    static let obstacleHeight: CGFloat = characterSize.height * 0.9
    static let obstacleSpacing: CGFloat = 210
    static let comboSpacing: CGFloat = 120

    static let gravity: CGFloat = -980

    // Vertical takeoff speed for target jump apex height: v = sqrt(2 * g * h)
    static var jumpVelocity: CGFloat {
        sqrt(2 * abs(gravity) * jumpHeight)
    }
}
