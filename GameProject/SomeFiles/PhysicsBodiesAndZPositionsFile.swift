//
//  PhysicsBodiesAndZPositionsFile.swift
//  GameProject
//
//  Created by Ира on 19.01.2024.
//

import Foundation

struct ZPositions {
    static let player: CGFloat = 10
    static let fallingCactus: CGFloat = 5
    static let foneElements: CGFloat = -5
    static let ui: CGFloat = 20
}

struct PhysicsBodies {
    static let player: UInt32 = 0x1 << 1
    static let fallingCactus: UInt32 = 0x1 << 2
}
