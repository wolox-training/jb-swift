//
//  UIButton.swift
//  WBooks
//
//  Created by joaquin bozzalla on 16/04/2021.
//

import UIKit

extension UIButton {
    
    func makeCustomOutlined(mainColor: UIColor = UIColor.buttonColor) {
        setTitleColor(mainColor, for: .normal)
        contentEdgeInsets = UIEdgeInsets(top: 15.0, left: 0.0, bottom: 15.0, right: 0.0)
    
        layer.borderWidth = 2.0
        layer.borderColor = mainColor.cgColor
        layer.cornerRadius = frame.height / 2
    }
    
    func makeCustomSolid() {
        setTitleColor(.white, for: .normal)
        contentEdgeInsets = UIEdgeInsets(top: 15.0, left: 0.0, bottom: 15.0, right: 0.0)

        layoutIfNeeded()
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = UIColor.blueGradientColors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.cornerRadius = frame.height / 2
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
