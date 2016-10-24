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

}
