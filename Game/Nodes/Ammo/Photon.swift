//
//  Photon.swift
//  Game
//
//  Created by Sergey Lyubeznov on 25/10/2016.
//  Copyright © 2016 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import GameKit

class Photon: SKSpriteNode {
    
    var deltaY:CGFloat? = 0
    
    func prepare() {
        
        isHidden = false
        zPosition = 0
        enablePhysicsBody()
        run(SKAction.repeatForever(SKAction.moveBy(x: 0, y: 300 + deltaY!, duration: 1)))
    }
    
    private func enablePhysicsBody() {
        
        physicsBody = SKPhysicsBody(rectangleOf:
            frame.size)
        
        physicsBody?.isDynamic = true
        physicsBody?.affectedByGravity = false
        physicsBody?.usesPreciseCollisionDetection = true
        physicsBody?.categoryBitMask = Constants.NodeCategories.Photon
        physicsBody?.collisionBitMask = 0
        physicsBody?.contactTestBitMask = Constants.NodeCategories.Asteroid
    }
    
}
