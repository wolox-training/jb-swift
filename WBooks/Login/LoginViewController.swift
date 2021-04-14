//
//  LoginViewController.swift
//  WBooks
//
//  Created by joaquin bozzalla on 08/04/2021.
//

import UIKit

final class LoginViewController: UIViewController {
    private lazy var loginView: LoginView = {
        let loginView = LoginView()
        loginView.delegate = self
        return loginView
    }()

    override func loadView() {
        super.loadView()
        self.view = loginView
    }
}

extension LoginViewController: LoginViewDelegate {
    func onLoginPressed() {
        let libraryViewController = UINavigationController(rootViewController: LibraryViewController())
        libraryViewController.modalPresentationStyle = .fullScreen
        present(libraryViewController, animated: true)
    }
}
