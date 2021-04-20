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
}
