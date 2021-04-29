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
    
    init(viewModel: BookSectionViewModel) {
        self.viewModel = viewModel
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
        bookSectionView.configure(with: viewModel)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bookSectionView.buttonRent.makeCustomSolid()
        bookSectionView.buttonAddToWishlist.makeCustomOutlined()
    }

    private func showUnavailableBookAlert() {
        showAlert(title: "ERROR_ALERT_TITLE".localized(), message: "UNAVAILABLE_BOOK_ALERT_MESSAGE".localized(), closeButtonLabel: "ALERT_CLOSE".localized())
    }
    
    private func onSuccessRent() {
        stopLoading()
        bookSectionView.configureAvailability(viewModel.status)
        showAlert(title: "SUCCESS_ALERT_TITLE".localized(), message: "SUCCESS_RENT_ALERT_MESSAGE".localized(), closeButtonLabel: "ALERT_CLOSE".localized())
    }
    
    private func onErrorRent(error: Error) {
        stopLoading()
        showAlert(title: "ERROR_ALERT_TITLE".localized(), message: "RENT_ERROR_ALERT_MESSAGE".localized(), closeButtonLabel: "ALERT_CLOSE".localized())
    }
    
    private func stopLoading() {
        bookSectionView.buttonRent.loadingIndicator(false)
        bookSectionView.buttonRent.isEnabled = viewModel.isBookAvailable
    }
}

extension BookSectionViewController: BookSectionViewDelegate {
    func onRentPressed() {
        bookSectionView.buttonRent.loadingIndicator(true)
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
