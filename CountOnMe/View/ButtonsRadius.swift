//
//  ButtonsRadius.swift
//  CountOnMe
//
//  Created by Jerome Krakus on 20/12/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import UIKit

@IBDesignable extension UIButton {

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}
