//
//  NewBookViewController.swift
//  WBooks
//
//  Created by joaquin bozzalla on 19/04/2021.
//

import UIKit

final class NewBookViewController: UIViewController {
    private let viewModel = NewBookViewModel()
    private lazy var newBookView: NewBookView = {
        let newBookView = NewBookView()
        newBookView.delegate = self
        return newBookView
    }()
    
    override func loadView() {
        super.loadView()
        view = newBookView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar(title: "NEW_BOOK_LABEL".localized())
        configureTextfields()
        // Hide the keyboard when the view is touched
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        newBookView.submitButton.makeCustomSolid()
    }
    
    private func configureTextfields() {
        newBookView.textfieldName.tag = 0
        newBookView.textfieldAuthor.tag = 1
        newBookView.textfieldYear.tag = 2
        newBookView.textfieldTopic.tag = 3
        newBookView.textfieldDescription.tag = 4
        
        newBookView.textfieldName.delegate = self
        newBookView.textfieldAuthor.delegate = self
        newBookView.textfieldYear.delegate = self
        newBookView.textfieldTopic.delegate = self
        newBookView.textfieldDescription.delegate = self
        
        viewModel.setValidator(textfield: newBookView.textfieldName)
        viewModel.setValidator(textfield: newBookView.textfieldAuthor)
        viewModel.setValidator(textfield: newBookView.textfieldYear)
        viewModel.setValidator(textfield: newBookView.textfieldTopic)
    }
    
    private func onSubmitSuccess() {
        newBookView.cleanForm()
        showAlert(title: "SUCCESS_ALERT_TITLE".localized(), message: "NEWBOOK_SUCCESS_ALERT_MESSAGE".localized(), closeButtonLabel: "ALERT_CLOSE".localized())
    }
    
    private func onSubmitError() {
        showAlert(title: "ERROR_ALERT_TITLE".localized(), message: "NEWBOOK_ERROR_ALERT_MESSAGE".localized(), closeButtonLabel: "ALERT_CLOSE".localized())
    }
    
    private func getBookFromForm() -> UnidentifiableBook {
        return UnidentifiableBook(
            title: newBookView.textfieldName.text ?? "",
            author: newBookView.textfieldAuthor.text ?? "",
            genre: newBookView.textfieldTopic.text ?? "",
            year: newBookView.textfieldYear.text ?? "",
            image: "imageURL",
            status: BookStatus.available
        )
    }
}

extension NewBookViewController: NewBookViewDelegate {
    
    func onSubmitPressed() {
        guard newBookView.formIsValid else {
            return
        }
        viewModel.loadBook(
            book: getBookFromForm(),
            onSuccess: { [weak self] _ in self?.onSubmitSuccess() },
            onError: { [weak self] _ in self?.onSubmitError() }
        )
    }
    
    func onBookImagePressed() {
        let alertController = UIAlertController(title: .none, message: .none, preferredStyle: .actionSheet)
        
        // Add gallery option
        let chooseAction = UIAlertAction(title: "GALLERY".localized(), style: .default) { [weak self] _ in
            self?.openImagePicker(withMode: .photoLibrary)
        }
        alertController.addAction(chooseAction)
        
        // Add camera option
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let takeAction = UIAlertAction(title: "CAMERA".localized(), style: .default) { [weak self] _ in
                self?.openImagePicker(withMode: .camera)
            }
            alertController.addAction(takeAction)
        }
        
        // Add cancel option
        let cancelAction = UIAlertAction(title: "CANCEL".localized(), style: .cancel, handler: .none)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func openImagePicker(withMode sourceType: UIImagePickerController.SourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = sourceType
        present(imagePickerController, animated: true, completion: .none)
    }
}

extension NewBookViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        newBookView.buttonBookImage.setBackgroundImage(image, for: .normal)
        picker.dismiss(animated: true, completion: nil)
    }
    
}

extension NewBookViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTextFieldTag = textField.tag + 1
        
        if let nextTextField = textField.superview?.viewWithTag(nextTextFieldTag) as? UITextField {
            nextTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
