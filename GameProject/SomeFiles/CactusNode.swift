//
//  CactusNode.swift
//  GameProject
//
//  Created by Ира on 19.01.2024.
//

import SpriteKit

class Cactus: SKSpriteNode {
    
    init() {
        let texture = SKTexture(imageNamed: "kaktusImage")
        
        super.init(texture: texture, color: .red, size: CGSize(width: 80, height: 100))
        self.texture = texture
        self.zPosition = ZPositions.fallingCactus
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.allowsRotation = true
        self.physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask = PhysicsBodies.fallingCactus
        self.physicsBody?.collisionBitMask = 0
        self.physicsBody?.contactTestBitMask = PhysicsBodies.player
        self.physicsBody?.mass = 10
        self.run(.repeatForever(SKAction.rotate(byAngle: .pi * 2, duration: 1)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
