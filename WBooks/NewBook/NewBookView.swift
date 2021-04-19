//
//  NewBookView.swift
//  WBooks
//
//  Created by joaquin bozzalla on 19/04/2021.
//

import UIKit

protocol NewBookViewDelegate: AnyObject {
    func onBookImagePressed()
}

final class NewBookView: NibView {
    weak var delegate: NewBookViewDelegate?
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var mainContainer: UIView! {
        didSet {
            mainContainer.backgroundColor = .backgroundColor
        }
    }
    @IBOutlet weak var formContainer: UIView! {
        didSet {
            formContainer.backgroundColor = .white
            formContainer.layer.cornerRadius = 5.0
            formContainer.layer.shadowColor = UIColor.systemGray.cgColor
            formContainer.layer.shadowOpacity = 0.4
            formContainer.layer.shadowOffset = .zero
            formContainer.layer.shadowRadius = 1
        }
    }
    @IBAction func onBookImagePressed(_ sender: Any) {
        delegate?.onBookImagePressed()
    }
    @IBOutlet weak var buttonBookImage: UIButton! {
        didSet {
            buttonBookImage.setBackgroundImage(UIImage.addBookImage, for: .normal)
        }
    }
}
