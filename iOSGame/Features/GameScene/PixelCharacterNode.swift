import SpriteKit

final class PixelCharacterNode: SKNode {
    let size: CGSize

    init(pixel: CGFloat = 4) {
        self.size = CGSize(width: pixel * 8, height: pixel * 10)
        super.init()
        build(pixel: pixel)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    private func build(pixel p: CGFloat) {
        let head = SKColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        let shirt = SKColor(red: 0.84, green: 0.23, blue: 0.12, alpha: 1)
        let pants = SKColor(red: 0.06, green: 0.08, blue: 0.10, alpha: 1)
        let accent = SKColor.white

        // Head (2x2 block)
        addBlock(x: 3, y: 7, color: head, p: p)
        addBlock(x: 4, y: 7, color: head, p: p)
        addBlock(x: 3, y: 8, color: head, p: p)
        addBlock(x: 4, y: 8, color: head, p: p)

        // Torso
        for y in 4...6 {
            addBlock(x: 3, y: y, color: shirt, p: p)
            addBlock(x: 4, y: y, color: shirt, p: p)
        }

        // Left arm
        addBlock(x: 2, y: 5, color: shirt, p: p)
        addBlock(x: 2, y: 4, color: shirt, p: p)

        // Right arm + white hand accent
        addBlock(x: 5, y: 5, color: shirt, p: p)
        addBlock(x: 6, y: 5, color: accent, p: p)

        // Legs
        addBlock(x: 3, y: 2, color: pants, p: p)
        addBlock(x: 4, y: 2, color: pants, p: p)
        addBlock(x: 2, y: 1, color: pants, p: p)
        addBlock(x: 3, y: 1, color: pants, p: p)
        addBlock(x: 4, y: 1, color: pants, p: p)
        addBlock(x: 5, y: 1, color: pants, p: p)
    }

    private func addBlock(x: Int, y: Int, color: SKColor, p: CGFloat) {
        let node = SKSpriteNode(color: color, size: CGSize(width: p, height: p))
        node.anchorPoint = CGPoint(x: 0, y: 0)
        node.position = CGPoint(x: CGFloat(x) * p, y: CGFloat(y) * p)
        addChild(node)
    }
}
