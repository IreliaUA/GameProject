//
//  PlayerNode.swift
//  GameProject
//
//  Created by Ира on 19.01.2024.
//

import SpriteKit

class Player: SKSpriteNode {
    
    init() {
        let texture = SKTexture(imageNamed: "heroImage")
        
        super.init(texture: texture, color: .red, size: CGSize(width: 100, height: 100))
        self.texture = texture
        self.zPosition = ZPositions.player
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask = PhysicsBodies.player
        self.physicsBody?.collisionBitMask = 0
        self.physicsBody?.contactTestBitMask = PhysicsBodies.fallingCactus
        self.physicsBody?.mass = 10
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
