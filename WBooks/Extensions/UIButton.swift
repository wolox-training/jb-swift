//
//  UIButton.swift
//  WBooks
//
//  Created by joaquin bozzalla on 21/04/2021.
//

import UIKit

extension UIButton {
    
    func makeCustomOutlined(mainColor: UIColor = UIColor.buttonColor) {
        setTitleColor(mainColor, for: .normal)
        layer.borderWidth = 1.0
        layer.borderColor = mainColor.cgColor
        layer.cornerRadius = frame.height / 2
    }
    
    func makeCustomSolid() {
        setTitleColor(.white, for: .normal)
        layoutIfNeeded()
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = UIColor.blueGradientColors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = frame.height / 2
        clipsToBounds = true
        layer.cornerRadius = frame.height / 2
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func loadingIndicator(_ show: Bool) {
        let tag = 808404
        if show {
            self.isEnabled = false
            self.alpha = 0.5
            let indicator = UIActivityIndicatorView()
            let buttonHeight = self.bounds.size.height
            let buttonWidth = self.bounds.size.width
            indicator.center = CGPoint(x: buttonWidth/2, y: buttonHeight/2)
            indicator.tag = tag
            self.addSubview(indicator)
            indicator.startAnimating()
        } else {
            self.isEnabled = true
            self.alpha = 1.0
            if let indicator = self.viewWithTag(tag) as? UIActivityIndicatorView {
                indicator.stopAnimating()
                indicator.removeFromSuperview()
            }
        }
    }
}

