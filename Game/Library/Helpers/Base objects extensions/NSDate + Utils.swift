//
//  NSDate + Utils.swift
//  Bunch-iOS
//
//  Created by Sergey Lyubeznov on 16/09/16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import Foundation

extension Date {
    
    func messageFormat() -> String {
    
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        return dateFormatter.string(from: self)
    }
    
    func messageFormatSecond() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm dd MMM yyyy"
        
        return dateFormatter.string(from: self)
    }
    
  static func getCountYearAt(_ string:String) -> Int {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        
        let date = dateFormatter.date(from: string)
        
        let calendar = Calendar.current
        let dateComponentsBirth = (calendar as NSCalendar).components([.year, .month, .day], from:date!)
        let dateComponentsNow = (calendar as NSCalendar).components([.year, .month, .day], from:Date())
        
        if ((dateComponentsNow.month! < dateComponentsBirth.month!) ||
            ((dateComponentsNow.month! == dateComponentsBirth.month!) && (dateComponentsNow.day! < dateComponentsBirth.day!))) {
            return dateComponentsNow.year! - dateComponentsBirth.year! - 1
        } else {
            return dateComponentsNow.year! - dateComponentsBirth.year!
        }
        
    }
    
    func forBackend() -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.string(from: self)
    }
}
