import SpriteKit

final class PlatformerScene: SKScene, SKPhysicsContactDelegate {
    private let controller: GameSessionController
    private let onFinish: (Bool, Int) -> Void

    private var onProgress: ((Int) -> Void)?
    private var player = SKSpriteNode(color: .white, size: CGSize(width: 36, height: 36))
    private var didSetup = false
    private var isOnGround = false
    private var didEndRun = false

    init(size: CGSize, controller: GameSessionController, onFinish: @escaping (Bool, Int) -> Void) {
        self.controller = controller
        self.onFinish = onFinish
        super.init(size: size)
        scaleMode = .resizeFill
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    func setProgressListener(_ listener: @escaping (Int) -> Void) {
        onProgress = listener
    }

    override func didMove(to view: SKView) {
        guard !didSetup else { return }
        didSetup = true

        backgroundColor = .black
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0, dy: controller.level.gravity)

        setupGround()
        setupPlayer()
        setupObstacles()
        setupFinish()

        controller.start()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard controller.state.phase == .running else { return }
        jump()
    }

    override func update(_ currentTime: TimeInterval) {
        guard controller.state.phase == .running else { return }

        player.physicsBody?.velocity.dx = controller.level.runSpeed
        controller.updateProgress(playerX: player.position.x)
        onProgress?(controller.state.score)

        if player.position.y < -80 {
            endRun(completed: false)
        }
    }

    func didBegin(_ contact: SKPhysicsContact) {
        let mask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask

        if mask == (PhysicsCategory.player | PhysicsCategory.ground) {
            isOnGround = true
        }

        if mask == (PhysicsCategory.player | PhysicsCategory.obstacle) {
            endRun(completed: false)
        }

        if mask == (PhysicsCategory.player | PhysicsCategory.finish) {
            endRun(completed: true)
        }
    }

    func didEnd(_ contact: SKPhysicsContact) {
        let mask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        if mask == (PhysicsCategory.player | PhysicsCategory.ground) {
            isOnGround = false
        }
    }

    private func endRun(completed: Bool) {
        guard !didEndRun else { return }
        didEndRun = true

        if completed {
            controller.complete()
        } else {
            controller.fail()
        }

        isPaused = true
        onFinish(completed, controller.state.score)
    }

    private func jump() {
        guard isOnGround else { return }
        player.physicsBody?.velocity.dy = 0
        player.physicsBody?.applyImpulse(CGVector(dx: 0, dy: controller.level.jumpImpulse))
    }

    private func setupGround() {
        let ground = SKNode()
        ground.position = CGPoint(x: 0, y: 70)
        ground.physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x: -3000, y: 0), to: CGPoint(x: 3000, y: 0))
        ground.physicsBody?.isDynamic = false
        ground.physicsBody?.categoryBitMask = PhysicsCategory.ground
        addChild(ground)
    }

    private func setupPlayer() {
        player.position = CGPoint(x: 120, y: 110)
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody?.allowsRotation = false
        player.physicsBody?.restitution = 0
        player.physicsBody?.categoryBitMask = PhysicsCategory.player
        player.physicsBody?.collisionBitMask = PhysicsCategory.ground | PhysicsCategory.obstacle
        player.physicsBody?.contactTestBitMask = PhysicsCategory.ground | PhysicsCategory.obstacle | PhysicsCategory.finish
        addChild(player)
    }

    private func setupObstacles() {
        for rect in controller.level.obstacleRects {
            let node = SKSpriteNode(color: .red, size: rect.size)
            node.anchorPoint = CGPoint(x: 0.5, y: 0)
            node.position = CGPoint(x: rect.midX, y: 70)
            node.physicsBody = SKPhysicsBody(rectangleOf: node.size, center: CGPoint(x: 0, y: node.size.height / 2))
            node.physicsBody?.isDynamic = false
            node.physicsBody?.categoryBitMask = PhysicsCategory.obstacle
            node.physicsBody?.contactTestBitMask = PhysicsCategory.player
            node.physicsBody?.collisionBitMask = PhysicsCategory.player
            addChild(node)
        }
    }

    private func setupFinish() {
        let finish = SKSpriteNode(color: .green, size: CGSize(width: 24, height: 180))
        finish.anchorPoint = CGPoint(x: 0.5, y: 0)
        finish.position = CGPoint(x: controller.level.finishX, y: 70)
        finish.physicsBody = SKPhysicsBody(rectangleOf: finish.size, center: CGPoint(x: 0, y: finish.size.height / 2))
        finish.physicsBody?.isDynamic = false
        finish.physicsBody?.categoryBitMask = PhysicsCategory.finish
        finish.physicsBody?.contactTestBitMask = PhysicsCategory.player
        finish.physicsBody?.collisionBitMask = 0
        addChild(finish)
    }
}
