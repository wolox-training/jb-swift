//
//  NewBookViewController.swift
//  WBooks
//
//  Created by joaquin bozzalla on 19/04/2021.
//

import UIKit

final class NewBookViewController: UIViewController {
    private lazy var newBookView: NewBookView = {
        let newBookView = NewBookView()
        newBookView.delegate = self
        return newBookView
    }()

    override func loadView() {
        super.loadView()
        self.view = newBookView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        //newBookView.submitButton.makeCustomSolid()
    }

    private func configureNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "NEW_BOOK_LABEL".localized()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.notifications, style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.search, style: .plain, target: nil, action: nil)
    }
    
}

extension NewBookViewController: NewBookViewDelegate {
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
        
        self.present(alertController, animated: true, completion: nil)
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
