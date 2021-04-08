//
//  LoginViewController.swift
//  WBooks
//
//  Created by joaquin bozzalla on 08/04/2021.
//

import UIKit

class LoginViewController: UIViewController {
    private lazy var loginView: LoginView = {
        let loginView = LoginView()
        loginView.delegate = self
        return loginView
    }()
    
    override func loadView() {
        super.loadView()
        self.view = loginView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension LoginViewController: LoginViewDelegate {
    func onLoginPressed() {
        print("Do something when the user taps the button")
    }
}
