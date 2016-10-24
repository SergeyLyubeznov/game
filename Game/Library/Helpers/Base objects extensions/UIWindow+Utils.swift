//
//  UIWindow+Utils.swift
//  Bunch-iOS
//
//  Created by Vitaliy Zhukov on 25.08.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import UIKit

public extension UIWindow
{
    public var visibleViewController: UIViewController? {
        return UIWindow.getVisibleViewControllerFrom(self.rootViewController)
    }
    
    public static func getVisibleViewControllerFrom(_ vc: UIViewController?) -> UIViewController? {
        if let nc = vc as? UINavigationController {
            return UIWindow.getVisibleViewControllerFrom(nc.visibleViewController)
        } else if let tc = vc as? UITabBarController {
            return UIWindow.getVisibleViewControllerFrom(tc.selectedViewController)
        } else {
            if let pvc = vc?.presentedViewController {
                return UIWindow.getVisibleViewControllerFrom(pvc)
            } else {
                return vc
            }
        }
    }
}

func currentVisibleController() -> UIViewController?
{
    if let window = UIApplication.shared.delegate?.window {
        return window?.visibleViewController
    }
    return nil
}
