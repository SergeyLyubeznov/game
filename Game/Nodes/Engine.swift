//
//  Engine.swift
//  Game
//
//  Created by Sergey Lyubeznov on 25/10/2016.
//  Copyright © 2016 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import GameKit

let actionName = "Pulse1"

class Engine: SKSpriteNode {
    
    var enable:Bool = false {
        didSet {
            enableEngine(state: enable)
        }
    }
    
    private func enableEngine(state:Bool) {
        if state {
            run(SKAction.repeatForever(SKAction(named: actionName)!))
        } else {
            removeAction(forKey: actionName)
        }
    }
}
