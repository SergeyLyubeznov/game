//
//  GameScene + GameInteraction.swift
//  Game
//
//  Created by Sergey Lyubeznov on 26/10/2016.
//  Copyright © 2016 Sergey Lyubeznov. All rights reserved.
//

import SpriteKit
import GameplayKit

extension GameScene:SKPhysicsContactDelegate {
    
    override func update(_ currentTime: TimeInterval) {
        
        checkAndRemoveBullets()
    }
    
    private func checkAndRemoveBullets() {
        
      let borderY = UIScreen.main.bounds.height
        enumerateChildNodes(withName:"Photon") { (node, stop) in
            print(node.position.y)
            if node.position.y - 50 > borderY {
                node.removeFromParent()
            }
        }
        
        enumerateChildNodes(withName:"Asteroid") { (node, stop) in
            print(node.position.y)
            if node.position.y < -700 {
                node.removeFromParent()
            }
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
    
        let firstNode = contact.bodyA.node as! SKSpriteNode
        let secondNode = contact.bodyB.node as! SKSpriteNode
        
        if firstNode.name == "Photon" && secondNode.name == "Asteroid" {
            contactAt(photon: firstNode as! Photon, and: secondNode as! Asteroid)
        } else if firstNode.name == "Asteroid" && secondNode.name == "Photon" {
            contactAt(photon: secondNode as! Photon, and: firstNode as! Asteroid)
        }
    }
    
    private func contactAt(photon:Photon, and asteroid:Asteroid) {
        print("asteroid destroyed")
        photon.removeFromParent()
        asteroid.removeFromParent()
    }
    
}

