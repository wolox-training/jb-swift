//
//  CustomTextfield.swift
//  WBooks
//
//  Created by joaquin bozzalla on 19/04/2021.
//

import UIKit

@IBDesignable
open class CustomTextfield: UITextField {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
        
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
    
    func customInit() {
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.red
        ])
        self.layer.borderColor = UIColor.red.cgColor
    }

}
