//
//  Utils.swift
//  Day
//
//  Created by Alexander Kozin on 11.05.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    static let executableName = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String

    static func swiftClassFromString(_ className: String) -> AnyClass? {
        return NSClassFromString(executableName + "." + className)
    }

    static func stringFromSwiftClass(_ swiftClass: AnyClass) -> String {
        return NSStringFromClass(swiftClass).components(separatedBy: ".").last!// NSClassFromString(executableName + "." + className)
    }

    static func dispatchMainSyncSafe(_ block:  () -> Void) {
        if (Thread.isMainThread) {
            block()
        } else {
            DispatchQueue.main.sync(execute: block)
        }
    }
}

public func RootViewController() -> UIViewController {
    return UIApplication.shared.delegate!.window!!.rootViewController!
}

public func NSLocalizedString(_ key: String) -> String {
    return NSLocalizedString(key, comment: "")
}

//public func requestForImage(_ url: URL) -> URLRequest
//{
//    let token = BNCAuthenticationManager.sharedInstance.token
//    let request = NSMutableURLRequest(url: url)
//    request.addValue("image/*", forHTTPHeaderField: "Accept")
//    request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//    return request as URLRequest
//}

public func iphone4() -> Bool {
  
    var result:Bool! = false
    if screenSize().height == 480 {
        result = true
    }
    
    return result
}

public func iphone5() -> Bool {
    
    var result:Bool! = false
    
    if screenSize().height == 568 {
        result = true
    }
    
    return result
}

public func iphone6() -> Bool {
    
    var result:Bool! = false
    
    if screenSize().height == 667 {
        result = true
    }
    
    return result
}

public func iphone6plus() -> Bool {
    
    var result:Bool! = false
    
    if screenSize().height == 736 {
        result = true
    }
    
    return result
}


internal func screenSize() -> CGRect {
    return UIScreen.main.bounds
}

public func loadViewFromXib(_ name:String, index:Int, frame:CGRect) -> UIView {
    let view = Bundle.main.loadNibNamed(name, owner: nil, options: nil)![index] as! UIView
    //view.frame = frame
    return view
}
