//
//  LoginViewController.swift
//  WBooks
//
//  Created by joaquin bozzalla on 08/04/2021.
//

import UIKit

class LoginViewController: UIViewController {
    let loginView = LoginView()
    
    override func loadView() {
        super.loadView()
        self.view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
