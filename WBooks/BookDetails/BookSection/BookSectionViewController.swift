//
//  BookSectionViewController.swift
//  WBooks
//
//  Created by joaquin bozzalla on 13/04/2021.
//

import UIKit

final class BookSectionViewController: UIViewController {
    private let viewModel: BookSectionViewModel
    private lazy var bookSectionView: BookSectionView = {
        let bookSectionView = BookSectionView()
        bookSectionView.delegate = self
        return bookSectionView
    }()
    private let bookImage: UIImage?
    
    init(book: Book, bookImage: UIImage? = nil) {
        self.bookImage = bookImage
        self.viewModel = BookSectionViewModel(book: book)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    override func loadView() {
        super.loadView()
        self.view = bookSectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookSectionView.configure(with: viewModel, bookImage: bookImage)
    }

    private func showUnavailableBookAlert() {
        showAlert(title: "ERROR_ALERT_TITLE".localized(), message: "UNAVAILABLE_BOOK_ALERT_MESSAGE".localized(), closeButtonLabel: "ALERT_CLOSE".localized())
    }
    
    private func onSuccessRent() {
        bookSectionView.buttonRent.isEnabled = true
        bookSectionView.configureAvailability(with: viewModel)
        showAlert(title: "SUCCESS_RENT_ALERT_TITLE".localized(), message: "SUCCESS_RENT_ALERT_MESSAGE".localized(), closeButtonLabel: "ALERT_CLOSE".localized())
    }
    
    private func onErrorRent(error: Error) {
        bookSectionView.buttonRent.isEnabled = true
        showAlert(title: "ERROR_ALERT_TITLE".localized(), message: "RENT_ERROR_ALERT_MESSAGE".localized(), closeButtonLabel: "ALERT_CLOSE".localized())
    }
    
    private func showAlert(title: String, message: String, closeButtonLabel: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: closeButtonLabel, style: .default, handler: nil))
        present(alert, animated: true)
    }

}

extension BookSectionViewController: BookSectionViewDelegate {
    func onRentPressed() {
        bookSectionView.buttonRent.isEnabled = false
        
        if viewModel.isBookAvailable {
            viewModel.rentBook(onSuccess: self.onSuccessRent, onError: self.onErrorRent)
        } else {
            showUnavailableBookAlert()
        }
    }
    
    func onAddWishlistPressed() {
        print("ADD TO WISHLIST!") // TODO
    }
}