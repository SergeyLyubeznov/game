//
//  MainShip.swift
//  Game
//
//  Created by Sergey Lyubeznov on 25/10/2016.
//  Copyright © 2016 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import GameKit

class MainShip: SKSpriteNode {
    
    
    
    var weapon:Weapon? {
        didSet {
            weapon?.prepare()
        }
    }

    var leftEngine:Engine? {
        didSet{
            leftEngine?.enable = true
        }
    }
    var rifghtEngine:Engine? {
        didSet{
            rifghtEngine?.enable = true
        }
    }
    
    func prepare() {
        leftEngine =  (self.childNode(withName: "//engine_fire1") as? Engine)!
        rifghtEngine = (self.childNode(withName: "//engine_fire2") as? Engine)!
        weapon = (self.childNode(withName: "//PhaserStandart") as? PhaserStandart)!
    }

    func fire() {
        if (weapon?.isReady)! {
            weapon?.fire()
        }
    }
}
