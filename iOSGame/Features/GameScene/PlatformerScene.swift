import SpriteKit

final class PlatformerScene: SKScene, SKPhysicsContactDelegate {
    private let controller: GameSessionController
    private let onFinish: (Bool, Int) -> Void

    private var onProgress: ((Int) -> Void)?
    private var onJump: (() -> Void)?
    private var onResult: ((Bool) -> Void)?

    private let worldNode = SKNode()
    private var obstacleNodes: [SKSpriteNode] = []

    private var player = SKSpriteNode(color: .clear, size: GameplayTuning.characterSize)
    private var didSetup = false
    private var isOnGround = false
    private var didEndRun = false

    private var lastUpdateTime: TimeInterval = 0
    private var traveledDistance: CGFloat = 0

    private let playerAnchorX: CGFloat = 120
    private var groundTopY: CGFloat { size.height * 0.35 }
    private var groundHeight: CGFloat { size.height * 0.35 }

    init(size: CGSize, controller: GameSessionController, onFinish: @escaping (Bool, Int) -> Void) {
        self.controller = controller
        self.onFinish = onFinish
        super.init(size: size)
        scaleMode = .resizeFill
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    func setProgressListener(_ listener: @escaping (Int) -> Void) { onProgress = listener }
    func setJumpListener(_ listener: @escaping () -> Void) { onJump = listener }
    func setResultListener(_ listener: @escaping (Bool) -> Void) { onResult = listener }

    func pauseGameplay() {
        guard controller.state.phase == .running else { return }
        controller.pause()
        isPaused = true
    }

    func resumeGameplay() {
        guard controller.state.phase == .paused else { return }
        controller.resume()
        isPaused = false
    }

    override func didMove(to view: SKView) {
        guard !didSetup else { return }
        didSetup = true

        backgroundColor = SKColor(red: 0.39, green: 0.73, blue: 0.76, alpha: 1)
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0, dy: controller.level.gravity)

        addChild(worldNode)

        setupBackgroundMountains()
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

        if lastUpdateTime == 0 {
            lastUpdateTime = currentTime
        }
        let dt = min(max(currentTime - lastUpdateTime, 0), 1.0 / 30.0)
        lastUpdateTime = currentTime

        let dx = controller.level.runSpeed * CGFloat(dt)
        traveledDistance += dx
        worldNode.position.x -= dx

        let virtualPlayerX = playerAnchorX + traveledDistance
        controller.updateProgress(playerX: virtualPlayerX)
        onProgress?(controller.state.score)

        if player.position.y < -80 {
            endRun(completed: false)
            return
        }

        if obstacleNodes.contains(where: { player.frame.intersects($0.calculateAccumulatedFrame()) }) {
            endRun(completed: false)
        }
    }

    func didBegin(_ contact: SKPhysicsContact) {
        let mask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        if mask == (PhysicsCategory.player | PhysicsCategory.ground) { isOnGround = true }
        if mask == (PhysicsCategory.player | PhysicsCategory.obstacle) { endRun(completed: false) }
        if mask == (PhysicsCategory.player | PhysicsCategory.finish) { endRun(completed: true) }
    }

    func didEnd(_ contact: SKPhysicsContact) {
        let mask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        if mask == (PhysicsCategory.player | PhysicsCategory.ground) { isOnGround = false }
    }

    private func endRun(completed: Bool) {
        guard !didEndRun else { return }
        didEndRun = true

        if completed { controller.complete() } else { controller.fail() }

        isPaused = true
        onResult?(completed)
        onFinish(completed, controller.state.score)
    }

    private func jump() {
        guard isOnGround else { return }
        player.physicsBody?.velocity.dy = GameplayTuning.jumpVelocity
        onJump?()
    }

    private func setupBackgroundMountains() {
        let leftMountain = SKSpriteNode(color: SKColor(red: 0.24, green: 0.62, blue: 0.64, alpha: 1), size: CGSize(width: 240, height: 180))
        leftMountain.position = CGPoint(x: size.width * 0.28, y: size.height * 0.62)
        leftMountain.zRotation = 0.78
        leftMountain.alpha = 0.55
        worldNode.addChild(leftMountain)

        let rightMountain = SKSpriteNode(color: SKColor(red: 0.33, green: 0.70, blue: 0.71, alpha: 1), size: CGSize(width: 180, height: 140))
        rightMountain.position = CGPoint(x: size.width * 0.76, y: size.height * 0.58)
        rightMountain.zRotation = 0.78
        rightMountain.alpha = 0.45
        worldNode.addChild(rightMountain)
    }

    private func setupGround() {
        let groundVisual = SKSpriteNode(color: SKColor(red: 0.65, green: 0.79, blue: 0.23, alpha: 1), size: CGSize(width: 7000, height: groundHeight))
        groundVisual.anchorPoint = CGPoint(x: 0.5, y: 0)
        groundVisual.position = CGPoint(x: 0, y: 0)
        worldNode.addChild(groundVisual)

        let groundLine = SKSpriteNode(color: SKColor(red: 0.58, green: 0.72, blue: 0.19, alpha: 1), size: CGSize(width: 7000, height: 8))
        groundLine.anchorPoint = CGPoint(x: 0.5, y: 0)
        groundLine.position = CGPoint(x: 0, y: groundTopY)
        worldNode.addChild(groundLine)

        let ground = SKNode()
        ground.position = CGPoint(x: 0, y: groundTopY)
        ground.physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x: -3000, y: 0), to: CGPoint(x: 3000, y: 0))
        ground.physicsBody?.isDynamic = false
        ground.physicsBody?.categoryBitMask = PhysicsCategory.ground
        addChild(ground)
    }

    private func setupPlayer() {
        player.position = CGPoint(x: playerAnchorX, y: groundTopY + player.size.height * 0.5)
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody?.allowsRotation = false
        player.physicsBody?.restitution = 0
        player.physicsBody?.mass = 1
        player.physicsBody?.categoryBitMask = PhysicsCategory.player
        player.physicsBody?.collisionBitMask = PhysicsCategory.ground | PhysicsCategory.obstacle
        player.physicsBody?.contactTestBitMask = PhysicsCategory.ground | PhysicsCategory.obstacle | PhysicsCategory.finish

        let pixelHuman = PixelCharacterNode(pixel: 4.5)
        pixelHuman.position = CGPoint(x: -18, y: -18)
        player.addChild(pixelHuman)

        addChild(player)
    }

    private func setupObstacles() {
        obstacleNodes = []
        for rect in controller.level.obstacleRects {
            let node = SKSpriteNode(color: SKColor(red: 0.89, green: 0.35, blue: 0.23, alpha: 1), size: rect.size)
            node.anchorPoint = CGPoint(x: 0.5, y: 0)
            node.position = CGPoint(x: rect.midX, y: groundTopY)
            node.physicsBody = SKPhysicsBody(rectangleOf: node.size, center: CGPoint(x: 0, y: node.size.height / 2))
            node.physicsBody?.isDynamic = false
            node.physicsBody?.categoryBitMask = PhysicsCategory.obstacle
            node.physicsBody?.contactTestBitMask = PhysicsCategory.player
            node.physicsBody?.collisionBitMask = PhysicsCategory.player
            obstacleNodes.append(node)
            worldNode.addChild(node)
        }
    }

    private func setupFinish() {
        let finish = SKSpriteNode(color: SKColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1), size: CGSize(width: 24, height: 180))
        finish.anchorPoint = CGPoint(x: 0.5, y: 0)
        finish.position = CGPoint(x: controller.level.finishX, y: groundTopY)
        finish.physicsBody = SKPhysicsBody(rectangleOf: finish.size, center: CGPoint(x: 0, y: finish.size.height / 2))
        finish.physicsBody?.isDynamic = false
        finish.physicsBody?.categoryBitMask = PhysicsCategory.finish
        finish.physicsBody?.contactTestBitMask = PhysicsCategory.player
        finish.physicsBody?.collisionBitMask = 0
        worldNode.addChild(finish)
    }
}
