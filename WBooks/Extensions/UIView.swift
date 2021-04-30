//
//  UIView.swift
//  WBooks
//
//  Created by joaquin bozzalla on 21/04/2021.
//

import UIKit

extension UIView {
    func makeCustomWhite() {
        layer.cornerRadius = 5.0
        layer.shadowColor = UIColor.systemGray.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = .zero
        layer.shadowRadius = 1
    }
}
