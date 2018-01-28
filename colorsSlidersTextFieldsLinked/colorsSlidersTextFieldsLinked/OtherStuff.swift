//
//  OtherStuff.swift
//  colorsSlidersTextFieldsLinked
//
//  Created by admin on 1/9/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

struct colorSlider {
    var slider: UISlider
    let color: UIColor
    init(color: UIColor, slider: UISlider) {
        self.color = color
        self.slider = slider
    }
}

struct colorTextField {
    var text: UITextField
    let color: UIColor
    init(color: UIColor, text: UITextField) {
        self.color = color
        self.text = text
    }
}
