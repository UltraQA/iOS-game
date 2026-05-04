import Foundation

enum PhysicsCategory {
    static let player: UInt32 = 1 << 0
    static let ground: UInt32 = 1 << 1
    static let obstacle: UInt32 = 1 << 2
    static let finish: UInt32 = 1 << 3
}
