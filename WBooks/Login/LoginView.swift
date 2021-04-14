//
//  LoginView.swift
//  WBooks
//
//  Created by joaquin bozzalla on 08/04/2021.
//

import UIKit

protocol LoginViewDelegate {
    func onLoginPressed()
}

final class LoginView: NibView {
    var delegate: LoginViewDelegate?
    
    @IBAction func onPressed(_ sender: Any) {
        delegate?.onLoginPressed()
    }
}
