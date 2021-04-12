//
//  LoginView.swift
//  WBooks
//
//  Created by joaquin bozzalla on 08/04/2021.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func onLoginPressed()
}

class LoginView: NibView {
    @IBOutlet weak var buttonLogin: UIButton! {
        didSet {
            buttonLogin.setTitle("LOGIN_BUTTON".localized(), for: .normal)
        }
    }
    @IBOutlet weak var textfieldUser: UITextField! {
        didSet {
            textfieldUser.placeholder = "USER_PLACEHOLDER".localized()
        }
    }
    @IBOutlet weak var textfieldPassword: UITextField! {
        didSet {
            textfieldPassword.placeholder = "PASSWORD_PLACEHOLDER".localized()
        }
    }
    
    weak var delegate: LoginViewDelegate?
    
    @IBAction func onPressed(_ sender: Any) {
        delegate?.onLoginPressed()
    }
}
