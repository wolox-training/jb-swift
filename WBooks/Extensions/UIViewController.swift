//
//  UIViewController.swift
//  WBooks
//
//  Created by joaquin bozzalla on 23/04/2021.
//

import UIKit

extension UIViewController {
    func addChild(_ child: UIView, into container: UIView) {
        container.addSubview(child)
        container.translatesAutoresizingMaskIntoConstraints = false
        child.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            child.topAnchor.constraint(equalTo: container.topAnchor),
            child.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            child.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            child.trailingAnchor.constraint(equalTo: container.trailingAnchor)
        ])
    }
}
