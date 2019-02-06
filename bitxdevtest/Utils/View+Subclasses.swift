//
//  View+Extensions.swift
//  bitxdevtest
//
//  Created by Lucas Bitar on 05/02/19.
//  Copyright © 2019 Lucas Bitar. All rights reserved.
//

import UIKit

class CustomView : UIView {
    
    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
}
