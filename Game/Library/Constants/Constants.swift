//
//  Constants.swift
//  Day
//
//  Created by Alexander Kozin on 25.03.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    struct API {
        static let clientId = "bamosMobile"
        static let clientPassword = "12345"
//        static let BaseURL = "http://bamos-api.gdsln.com:8080/" //SvTAGE
        static let BaseURL = "http://bamos-api.gdsln.com:33089/" //DE
        
    }
    
    struct Notifications {
        static let ProfileChanged = "kBamosNotificationProfileChanged"
        static let SpeedChanged = "kGameNotificationSpeedChanged"
        
    }
    
    struct Colors {
        static let Blue = UIColor(hexString: "14B7E1")
        static let GrayButton = UIColor(hexString: "BDBFC1")
        static let LightGray = UIColor(hexString: "EEEEEE")
        static let LightText = UIColor(hexString: "A3A3A3")
        static let DarkText = UIColor(hexString: "373737")
    }
    
    struct Fonts {
        static let Regular14 = UIFont(name: "HelveticaNeue", size: 14.0)
        static let Regular19 = UIFont(name: "HelveticaNeue", size: 19.0)
    }
    
    struct SideMenu {
        static let Width:CGFloat = {
            
            var width:CGFloat = 305 // default for iphone 6 plus
            
            if iphone5() || iphone4() {
                width = 265
            } else if iphone6() {
                width = 288
            }
            return width
        }()
    }
    
}
