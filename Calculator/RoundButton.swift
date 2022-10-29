//
//  RoundButton.swift
//  Calculator
//
//  Created by kovil savaj on 28/10/22.
//

import UIKit
@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var roundButton:Bool = false {
        didSet{
            if roundButton {
                layer.cornerRadius = frame.height / 3
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height / 3
        }
    }
    

}
