//
//  Asteroid.swift
//  Game
//
//  Created by Sergey Lyubeznov on 26/10/2016.
//  Copyright © 2016 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import SpriteKit
import GameKit

class Asteroid: SKSpriteNode {
    
    var hp:Int?
    var score:UInt32?
    private var deltaY:CGFloat = 50.0
    
    func prepare() {
        zPosition = 0
        enablePhysicsBody()
    }
    
    private func enablePhysicsBody() {
    
        physicsBody = SKPhysicsBody.init(circleOfRadius: frame.size.width / 3 )
        
        
        physicsBody?.isDynamic = true
        physicsBody?.affectedByGravity = false
        physicsBody?.categoryBitMask = Constants.NodeCategories.Asteroid
        physicsBody?.contactTestBitMask = Constants.NodeCategories.Photon
        physicsBody?.collisionBitMask = 0
    }
    
    func fly() {
        
        run(SKAction.repeatForever(SKAction.moveBy(x: 0, y: -250 - deltaY, duration: 1)))
    }
    
}
