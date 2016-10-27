//
//  AsteroidGenerator.swift
//  Game
//
//  Created by Sergey Lyubeznov on 26/10/2016.
//  Copyright © 2016 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import SpriteKit

enum AsteriodType:UInt32 {
    case small = 0
    case medium = 1
    case large = 2
}

let asteriodName = "a"

class AsteroidGenerator: NSObject {

    class func asteroidAt(type:AsteriodType) -> Asteroid {
        
        let asteroid:Asteroid = Asteroid.init()
        asteroid.texture = textureAt(type: type)
        asteroid.name = "Asteroid"
        
        switch type {
        case .small:
            asteroid.size = CGSize.init(width: 120, height: 120)
            asteroid.hp = 5
            asteroid.score = 5
            break
        case .medium:
            asteroid.size = CGSize.init(width: 180, height: 180)
            asteroid.hp = 10
            asteroid.score = 10
            break
        case .large:
            asteroid.size = CGSize.init(width: 240, height: 240)
            asteroid.hp = 15
            asteroid.score = 15
            break
        }
        asteroid.prepare()
        return asteroid
    }
    
    class private func textureAt(type:AsteriodType) -> SKTexture {
        
        let randomNumber = arc4random_uniform(16) + 10000
        let imageName = asteriodName + randomNumber.description
    
        return SKTexture.init(imageNamed:imageName)
    }
}
