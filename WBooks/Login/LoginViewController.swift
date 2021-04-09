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
        let mainMenuViewController = UINavigationController(rootViewController: MainMenuViewController())
        mainMenuViewController.modalPresentationStyle = .fullScreen
        present(mainMenuViewController, animated: true, completion: nil)
    }
}
