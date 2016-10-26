//
//  GameManager.swift
//  Game
//
//  Created by Sergey Lyubeznov on 25/10/2016.
//  Copyright © 2016 Sergey Lyubeznov. All rights reserved.
//

import Foundation

class GameManager: NSObject {
    
    internal static let sharedInstance = GameManager()
    
    var speedShoot = 50 {
        didSet{
            let center = NotificationCenter.default
            center.post(name: NSNotification.Name(rawValue: Constants.Notifications.SpeedChanged), object: nil)
        }
    }
}
