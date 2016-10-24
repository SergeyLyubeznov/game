//
//  UITableView+Utils.swift
//  C-way
//
//  Created by Sergey Lyubeznov on 25/07/16.
//  Copyright © 2016 El-Machine. All rights reserved.
//

import UIKit

extension UITableView {
    func hideEmptyCells() {
        tableFooterView = UIView(frame:CGRect.zero)
    }
    
}
