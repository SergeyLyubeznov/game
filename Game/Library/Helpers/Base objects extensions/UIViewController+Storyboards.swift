//
//  UIViewController+Storyboards.swift
//  Day
//
//  Created by Alexander Kozin on 12.05.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import UIKit

/** Storyboards Extends UIViewController

*/
extension UIViewController {
    static func controller() -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName(), bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier())
    }

    class func storyboardName() -> String {
        return "Main"
    }

    class func storyboardIdentifier() -> String {
        return Utils.stringFromSwiftClass(self)
    }

    @IBAction func back(_ sender: AnyObject?) {
        dismiss(animated: true, completion: nil)
    }
}
