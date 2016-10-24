//
//  UIColor+Utils.swift
//  Day
//
//  Created by Alexander Kozin on 22.02.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static func tintColor() -> UIColor {
        return UIColor(red255: 248, green255: 107, blue255: 29, alpha255: 255)
    }

    convenience init(red255: UInt, green255: UInt, blue255: UInt, alpha255: UInt) {
        self.init(red: CGFloat(red255) / 255,
            green: CGFloat(green255) / 255,
            blue: CGFloat(blue255) / 255,
            alpha: CGFloat(alpha255) / 255)
    }
    
    convenience init(hexString:String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
