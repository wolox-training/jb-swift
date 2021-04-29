//
//  UIViewController.swift
//  WBooks
//
//  Created by joaquin bozzalla on 19/04/2021.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String, closeButtonLabel: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: closeButtonLabel, style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    func fixIn(_ child: UIView, into container: UIView) {
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
    
    func fixIn(_ childController: UIViewController, into container: UIView) {
        childController.willMove(toParent: self)
        addChild(childController)
        childController.didMove(toParent: self)
        container.addSubview(childController.view)
        
        container.translatesAutoresizingMaskIntoConstraints = false
        childController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: childController.view.topAnchor),
            container.bottomAnchor.constraint(equalTo: childController.view.bottomAnchor),
            container.leadingAnchor.constraint(equalTo: childController.view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: childController.view.trailingAnchor)
        ])
    }
}
