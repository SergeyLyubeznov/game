//
//  BaseNavigationController.swift
//  C-way
//
//  Created by Pavel Deminov on 20/07/16.
//  Copyright © 2016 El-Machine. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let font = UIFont(name: "Comfortaa", size: 25)
        let color = UIColor.black
        let attributesDictionary = [NSFontAttributeName: font!, NSForegroundColorAttributeName: color]
        navigationBar.titleTextAttributes = attributesDictionary
        navigationBar.tintColor = color
        navigationBar.barTintColor = UIColor.white
    }

}
