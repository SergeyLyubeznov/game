//
//  PhaserStandart.swift
//  Game
//
//  Created by Sergey Lyubeznov on 25/10/2016.
//  Copyright © 2016 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import GameKit

class PhaserStandart: Weapon {

    private var photon:Photon?
    private var deltaY:CGFloat = 50.0
    
    
    internal func updateValues() {
        
       deltaY =  CGFloat(GameManager.sharedInstance.speedShoot)
    }
    
   override func prepare() {
        photon = (self.childNode(withName: "//Photon") as? Photon)!
        photon?.isHidden = true
        isReady = true
        speed = 20
        subscribeNotifications(enable: true)
    }
    
    override func fire() {
        
        run(SKAction.repeatForever(SKAction.sequence([SKAction.wait(forDuration: 4),
                                                      SKAction.perform(#selector(createPhoton),
                                                                    onTarget: self)])))
    }
    
    internal func createPhoton() {
        
        let p = self.photon?.copy() as? Photon
        var point = self.photon?.position
        let parentPoint = parent?.position
        point?.y = (point?.y)! + (parentPoint?.y)! + 50
        point?.x = (point?.x)! + (parentPoint?.x)!
        
        p?.position = point!
        p?.isHidden = false
        p?.run(SKAction.repeatForever(SKAction.moveBy(x: 0, y: 250 + deltaY, duration: 1)))
        scene?.addChild(p!)
        
    }
    
    deinit {
        subscribeNotifications(enable: false)
    }
    
    func subscribeNotifications(enable: Bool) {
        
        let center = NotificationCenter.default
        
        if enable {
            center.addObserver(self, selector:#selector(updateValues), name: NSNotification.Name(rawValue: Constants.Notifications.SpeedChanged), object: nil)
        } else {
            center.removeObserver(self)
        }
    }
}
