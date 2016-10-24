//
//  BaseViewController.swift
//  Day
//
//  Created by Alexander Kozin on 12.01.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    internal var activityView:UIView?
    internal var activiryIndicator:UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @IBAction func prepareForUnwind(_ segue: UIStoryboardSegue) {

    }

    @IBAction func unwind() {
        self.performSegue(withIdentifier: "unwind", sender: self)
    }
    
}
