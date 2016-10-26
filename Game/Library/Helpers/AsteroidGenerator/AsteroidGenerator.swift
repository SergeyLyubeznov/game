//
//  AsteroidGenerator.swift
//  Game
//
//  Created by Sergey Lyubeznov on 26/10/2016.
//  Copyright © 2016 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import SpriteKit

enum AsteriodType:String {
    case small = "small"
    case medium = "medium"
    case large = "large"
}

let smallAsteriodName = "a"

class AsteroidGenerator: NSObject {

    class func asteroidAt(type:AsteriodType) -> Asteroid {
        
        let asteroid:Asteroid = Asteroid.init()
        asteroid.texture = textureAt(type: type)
        asteroid.name = "Asteroid"
        
        switch type {
        case .small:
            asteroid.size = CGSize.init(width: 180, height: 180)
            asteroid.hp = 21
            asteroid.score = 5
            break
        default:
            return asteroid
        }
        
        return asteroid
    }
    
    class private func textureAt(type:AsteriodType) -> SKTexture {
        
        let randomNumber = arc4random_uniform(16) + 10000
        print(randomNumber.description)
        var imageName = ""
        
        if type == .small {
            imageName = smallAsteriodName + randomNumber.description
        } else if type == .medium {
            
        } else {
            
        }
    
        return SKTexture.init(imageNamed:imageName)
    }
}
