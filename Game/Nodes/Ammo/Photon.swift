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
    
    override var position: CGPoint {
        didSet{
            print(position)
        }
    }
}
