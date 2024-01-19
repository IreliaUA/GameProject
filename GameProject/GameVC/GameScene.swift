//
//  GameScene.swift
//  GameProject
//
//  Created by Ира on 15.01.2024.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    var player = Player()
//    var fallingcactus = Cactus()
    
    
    override func didMove(to view: SKView) {
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -2.0)
        //player.size = CGSize(width: 50, height: 50)
        addChild(player)
        //addChild(fallingcactus)
        self.run(.sequence([
            .wait(forDuration: 3),
            .run {
                self.startGame()
            }
        ]))
        player.position = CGPoint(x: 0, y: -400)
    }
    
    func startGame() {
        let sequenceAction = SKAction.sequence([.wait(forDuration: 1),.run {
            self.spawnCactus()
        }])
        let repeatAction = SKAction.repeatForever(sequenceAction)
        
        run(repeatAction)
        
//        self.run(.repeatForever(.sequence([
//            .wait(forDuration: 2),
//            .run {
//                self.spawnCactus()
//            }
//        ])))
    }
    
    func spawnCactus() {
        var cac = Cactus()
        cac.position = CGPoint(x: CGFloat.random(in: frame.minX + 100...frame.maxX - 100), y: frame.maxY)
        var ransize: [(Double, Double)] = [(72, 80),(96,120)]
        if let randSize = ransize.randomElement() {
            cac.size = CGSize(width: randSize.0, height: randSize.1)
            addChild(cac)
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
   // func
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.white
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
