//
//  TintedButton.swift
//  Day
//
//  Created by Alexander Kozin on 22.02.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import UIKit

class TintedButton: UIButton {
    override func awakeFromNib() {
        setImage(image(for: UIControlState()), for: UIControlState())
    }

    override func setImage(_ image: UIImage?, for state: UIControlState) {
        let templateImage = image?.withRenderingMode(.alwaysTemplate)
        super.setImage(templateImage, for: state)
    }
}
