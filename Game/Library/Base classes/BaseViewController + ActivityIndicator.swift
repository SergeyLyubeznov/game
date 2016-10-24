//
//  BaseViewController + ActivityIndicator.swift
//  C-way
//
//  Created by Sergey Lyubeznov on 22/08/16.
//  Copyright © 2016 El-Machine. All rights reserved.
//

import UIKit

extension BaseViewController {
    
    internal func createActivityIndicator() {
        
        let indicator = UIActivityIndicatorView.init(activityIndicatorStyle: .white)
        indicator.color = UIColor.white
        indicator.center = view.center
        activiryIndicator = indicator
    }
    
    func showActivityIndicator() {
        
        if activiryIndicator == nil {
            createActivityIndicator()
        }
        
        if Thread.isMainThread {
            startAnimatingActivity()
        } else {
            DispatchQueue.main.async(execute: {
                self.startAnimatingActivity()
            })
        }
    }
    
    fileprivate func startAnimatingActivity() {
        
        activiryIndicator?.startAnimating()
        view.addSubview(activiryIndicator!)
    }
    
    func hideActivityIndicator() {
        
        if Thread.isMainThread {
            stopAnimatingActivity()
        } else {
            DispatchQueue.main.async(execute: {
                self.stopAnimatingActivity()
            })
        }
    }
    
    fileprivate func stopAnimatingActivity() {
        activiryIndicator?.removeFromSuperview()
        activiryIndicator?.stopAnimating()
    }
}
