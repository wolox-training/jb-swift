//
//  NewBookView.swift
//  WBooks
//
//  Created by joaquin bozzalla on 19/04/2021.
//

import UIKit

protocol NewBookViewDelegate: AnyObject {
    func onBookImagePressed()
    func onSubmitPressed()
}

final class NewBookView: NibView {
    weak var delegate: NewBookViewDelegate?
    
    @IBOutlet weak var submitButton: UIButton! {
        didSet {
            submitButton.setTitle("SUBMIT".localized(), for: .normal)
        }
    }
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
    @IBOutlet weak var buttonBookImage: UIButton! {
        didSet {
            buttonBookImage.setBackgroundImage(UIImage.addBookImage, for: .normal)
        }
    }
    @IBOutlet weak var textfieldName: CustomTextfield! {
        didSet {
            textfieldName.placeholder = "NAME_TEXTFIELD".localized()
        }
    }
    @IBOutlet weak var textfieldAuthor: CustomTextfield! {
        didSet {
            textfieldAuthor.placeholder = "AUTHOR_TEXTFIELD".localized()
        }
    }
    @IBOutlet weak var textfieldYear: CustomTextfield! {
        didSet {
            textfieldYear.placeholder = "YEAR_TEXTFIELD".localized()
        }
    }
    @IBOutlet weak var textfieldTopic: CustomTextfield! {
        didSet {
            textfieldTopic.placeholder = "TOPIC_TEXTFIELD".localized()
        }
    }
    @IBOutlet weak var textfieldDescription: CustomTextfield! {
        didSet {
            textfieldDescription.placeholder = "DESCRIPTION_TEXTFIELD".localized()
        }
    }
    
    // MARK: - Actions
    @IBAction func onSubmitPressed(_ sender: Any) {
        delegate?.onSubmitPressed()
    }
    
    @IBAction func onBookImagePressed(_ sender: Any) {
        delegate?.onBookImagePressed()
    }
    
    var formIsValid: Bool {
        return textfieldName.isValid() && textfieldAuthor.isValid() && textfieldYear.isValid() && textfieldTopic.isValid()
    }
    
    func cleanForm() {
        textfieldName.text = ""
        textfieldYear.text = ""
        textfieldTopic.text = ""
        textfieldAuthor.text = ""
        textfieldDescription.text = ""
        buttonBookImage.setBackgroundImage(UIImage.addBookImage, for: .normal)
    }
}
