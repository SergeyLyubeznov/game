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
//        static let BaseURL = "http://bamos-api.gdsln.com:8080/" //STAGE
        static let BaseURL = "http://bamos-api.gdsln.com:33089/" //DEV
        static let CheckUsernamePath = "user/isAvailable"
        static let RegisterPath = "user/register"
        static let TokenPath = "oauth/token"
        static let TermsPath = "terms/"
        static let LocationsListPath = "location/getAll"
        static let EventsListPath = "event/getAll"
        static let EventDetailsPath = "event/"
        static let EventEditPath = "event/edit/"
        static let EventFavoritesPath = "event/favor"
        static let EventsListInCategoryPath = "event/getByCategory/"
        static let EventsListForUserPath = "event/getByUser/"
        static let UsersListPath = "user/getAll"
        static let UserDetailsPath = "user/"
        static let UserFavoritesPath = "user/favor"
        static let FollowersPath = "user/follower"
        static let FollowPath = "user/follow"
        static let CategoriesListPath = "category/getAll"
        static let DialoguesListPath = "conversation/"
        static let UnreadMessagesCountPath = "conversation/unread"
        static let MarkMessageAsReadPath = "message/id/read"
        static let ProfilePath = "profile/"
        static let TempVideoURL = "http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_1mb.mp4"
        static let ImageUploadPath = "uploadImage"
        static let VideoUploadPath = ""
        static let MessageNewPath = ""
        static let RegisterFacebookUserPath = "user/registerFacebookAccount"
        
    }
    
    struct Notifications {
        static let ProfileChanged = "kBamosNotificationProfileChanged"
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
