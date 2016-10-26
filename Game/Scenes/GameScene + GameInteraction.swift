//
//  GameScene + GameInteraction.swift
//  Game
//
//  Created by Sergey Lyubeznov on 26/10/2016.
//  Copyright © 2016 Sergey Lyubeznov. All rights reserved.
//

import SpriteKit
import GameplayKit

extension GameScene {
    
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
    
}

