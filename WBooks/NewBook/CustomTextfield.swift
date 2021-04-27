//
//  CustomTextfield.swift
//  WBooks
//
//  Created by joaquin bozzalla on 19/04/2021.
//

import UIKit

@IBDesignable
open class CustomTextfield: UITextField {
    private let textfieldColor = UIColor.systemGray3
    var validator: ((String) -> Bool)?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
        
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
    
    func customInit() {
        addTarget(self, action: #selector(isValid), for: .editingChanged)
        
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [
            NSAttributedString.Key.foregroundColor: textfieldColor
        ])
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = textfieldColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    
    @objc func isValid() -> Bool {
        if let validatorFunction = validator, let text = self.text {
            let result = validatorFunction(text)
            self.layer.shadowColor = result ? textfieldColor.cgColor : UIColor.red.cgColor
            return result
        }
        return true
    }
}
