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
        fixIn(childController.view, into: container)
    }
    
    func configureNavigationBar(title: String = "") {
        navigationItem.backButtonDisplayMode = UINavigationItem.BackButtonDisplayMode.minimal
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = title
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.notifications, style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.search, style: .plain, target: nil, action: nil)
    }
}

