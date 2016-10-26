//
//  GameScene + Creating.swift
//  Game
//
//  Created by Sergey Lyubeznov on 26/10/2016.
//  Copyright © 2016 Sergey Lyubeznov. All rights reserved.
//

import SpriteKit
import GameplayKit

extension GameScene {
    
    internal func creatGameZone() {
    
        createMainShip()
        creatAsteroids()
    }
    
    private func createMainShip() {
        
        let ship:MainShip = self.childNode(withName: "//ship") as! MainShip
        ship.prepare()
        ship.fire()
        
        self.ship = ship
    }
    
    private func creatAsteroids() {
    
        run(SKAction.repeatForever(SKAction.sequence([SKAction.wait(forDuration: 1),
                                                      SKAction.perform(#selector(creatAsteroid),
                                                                       onTarget: self)])))
    }
    
    @objc private func creatAsteroid() {
        
        let asteroid = AsteroidGenerator.asteroidAt(type: .small)
        asteroid.position = CGPoint(x:100,y:100)
        addChild(asteroid)
    }
}

