//
//  NSObject+Xib.swift
//  Day
//
//  Created by Alexander Kozin on 11.05.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import Foundation

/** Xib Extends NSObject

*/
extension NSObject {

    static func objectFromXib() -> AnyObject {
        return objectFromXib(nibName(), withOwner: nil)
    }

    static func objectFromXibWithOwner(_ owner: AnyObject?) -> AnyObject {
        return objectFromXib(nibName(), withOwner: owner)
    }

    static func objectFromXib(_ nibName: String, withOwner owner: AnyObject?) -> AnyObject {
        let object = Bundle.main.loadNibNamed(nibName, owner: owner, options: nil)!.first!
        return object as AnyObject
    }

    static func nibName() -> String {
        return Utils.stringFromSwiftClass(self)
    }
}
