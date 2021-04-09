//
//  LoginViewController.swift
//  WBooks
//
//  Created by joaquin bozzalla on 08/04/2021.
//

import UIKit

final class LoginViewController: UIViewController {
    private let loginView = LoginView()
    
    override func loadView() {
        super.loadView()
        self.view = loginView
    }
}
