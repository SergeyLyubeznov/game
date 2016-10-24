//
//  String + Utils.swift
//  C-way
//
//  Created by Sergey Lyubeznov on 02/08/16.
//  Copyright © 2016 El-Machine. All rights reserved.
//

import Foundation

extension String {
    
    var first: String {
        return String(characters.prefix(1))
    }
    
    var second: String {
        return String(characters.prefix(2))
    }
    
    var last: String {
        return String(characters.suffix(1))
    }
    
    var length: Int {
        return characters.count
    }
    
    func insert(_ string:String,ind:Int) -> String {
        return  String(self.characters.prefix(ind)) + string + String(self.characters.suffix(self.characters.count-ind))
    }
    
    func removeLast() -> String {
        let index1 = self.characters.index(self.endIndex, offsetBy: -1)
        return self.substring(to: index1)
    }
    
    func stringToIndex(_ ind:Int) -> String {
        let index1 = self.characters.index(self.startIndex, offsetBy: ind)
        return self.substring(to: index1)
    }
    
    static func randomStringWithLength (_ len : Int) -> NSString {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        let randomString : NSMutableString = NSMutableString(capacity: len)
        
        for _ in 0 ..< len {
            let length = UInt32 (letters.length)
            let rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.character(at: Int(rand)))
        }
        return randomString
    }
}
