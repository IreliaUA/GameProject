//
//  GameScene.swift
//  GameProject
//
//  Created by Ира on 15.01.2024.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    weak var gameVC: IGameViewController?
    
    var player = Player()
    var scoreLabel: SKLabelNode!
    var score: Int = 0 {
        didSet{
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    override func didMove(to view: SKView) {
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -2.0)
        self.physicsWorld.contactDelegate = self
        //player.size = CGSize(width: 50, height: 50)
        
        startGame()
    }
    
    func setupScoreLabel() {
        scoreLabel = SKLabelNode(fontNamed: "Marker Felt")
        scoreLabel.text = "Score: 0"
        scoreLabel.fontSize = 24
        let color = SKColor(red: 131/255.0, green: 78/255.0, blue: 0, alpha: 1.0)
        scoreLabel.fontColor = color
        scoreLabel.position = CGPoint(x: frame.maxX - 150, y: frame.maxY - 150)
        scoreLabel.zPosition = 20
        addChild(scoreLabel)
    }
    
    func startGame() {
        
        addChild(player)
        player.removeAllChildren()
        
        let trail = getParticle(name: "playerTrail", targetNode: self, pos: CGPoint(x: 0, y: -60))
        trail.zPosition = self.zPosition + 100
        player.addChild(trail)
        
        setupScoreLabel()
        
        player.position = CGPoint(x: frame.midX, y: -400)
        
        let sequenceAction = SKAction.sequence([.wait(forDuration: 1),.run {
            self.spawnCactus()
            self.score += 1
        }])
        let repeatAction = SKAction.repeatForever(sequenceAction)
        
        run(repeatAction, withKey: "spawnActions")
        
        //        self.run(.repeatForever(.sequence([
        //            .wait(forDuration: 2),
        //            .run {
        //                self.spawnCactus()
        //            }
        //        ])))
    }
    
    func getParticle(name: String, targetNode: SKNode, pos: CGPoint)-> SKEmitterNode {
        let emitter = SKEmitterNode(fileNamed: name)!
        emitter.position = pos
        emitter.targetNode = targetNode
        return emitter
    }
    
    func spawnCactus() {
        let cac = Cactus()
        cac.position = CGPoint(x: CGFloat.random(in: frame.minX + 100...frame.maxX - 100), y: frame.maxY)
        let ransize: [(Double, Double)] = [(72, 80),(96,120)]
        if let randSize = ransize.randomElement() {
            cac.size = CGSize(width: randSize.0, height: randSize.1)
            addChild(cac)
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        
        
        if (bodyA.categoryBitMask == PhysicsBodies.player && bodyB.categoryBitMask == PhysicsBodies.fallingCactus) ||
            (bodyA.categoryBitMask == PhysicsBodies.fallingCactus && bodyB.categoryBitMask == PhysicsBodies.player) {
            
            showResultVC(score: score)
        }
    }
    
    func showResultVC(score: Int) {
        children.forEach { child in
            if child.name == "cactus" {
                child.removeFromParent()
            }
        }
        
        player.removeFromParent()
        scoreLabel.removeFromParent()
        self.removeAction(forKey: "spawnActions")
        gameVC?.showres(score: score, closure: {
            self.score = 0
            self.startGame()
            self.player.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 400)
        })
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let currentTouchLocation = touch.location(in: self)
        let previousTouchLocation = touch.previousLocation(in: self)
        
        let swipeThreshold: CGFloat = 50
        
        let swipeDistance = currentTouchLocation.x - previousTouchLocation.x
        
        if swipeDistance < -swipeThreshold {
            swipeLeft()
        } else if swipeDistance > swipeThreshold {
            swipeRight()
        }
    }
    
    func swipeLeft(){
        let moveLeft = SKAction.moveTo(x: frame.minX + player.size.width + 50, duration: 0.7)
        player.run(moveLeft)
        // player.run(.moveTo(x: frame.minX, duration: 1))
    }
    
    func  swipeRight(){
        let moveLeft = SKAction.moveTo(x: frame.maxX - player.size.width - 50, duration: 0.7)
        player.run(moveLeft)
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
}
