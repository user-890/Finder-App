//
//  RoundButton.swift
//  Finder
//
//  Created by Tyler Holloway on 8/1/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    
    // By default no corner radius
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    

}
