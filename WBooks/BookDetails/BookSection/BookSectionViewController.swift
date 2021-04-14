//
//  BookSectionViewController.swift
//  WBooks
//
//  Created by joaquin bozzalla on 13/04/2021.
//

import UIKit

final class BookSectionViewController: UIViewController {
    private let _book: Book
    private lazy var _bookSectionView: BookSectionView = {
        let bookSectionView = BookSectionView()
        bookSectionView.delegate = self
        return bookSectionView
    }()

    init(book: Book) {
        self._book = book
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    override func loadView() {
        super.loadView()
        self.view = _bookSectionView
        configureBookDetails()
    }
    
    private func configureBookDetails() {
        self._bookSectionView.labelTitle.text = _book.title
        self._bookSectionView.labelAuthor.text = _book.author
        self._bookSectionView.labelGenre.text = _book.genre
        self._bookSectionView.labelYear.text = _book.year
        self._bookSectionView.labelAvailability.text = _book.isAvailable() ? "BOOK_AVAILABLE".localized() : "BOOK_UNAVAILABLE".localized()
        self._bookSectionView.labelAvailability.textColor = _book.isAvailable() ? .systemGreen : .systemRed
        self._bookSectionView.imageBook.loadFromURL(stringURL: _book.image)
    }
    
    private func unavailableBookAlert() {
        let message = UIAlertController(title: "UNAVAILABLE_BOOK_ALERT_TITLE".localized(), message: "UNAVAILABLE_BOOK_ALERT_MESSAGE".localized(), preferredStyle: .alert)
        message.addAction(UIAlertAction(title: "UNAVAILABLE_BOOK_ALERT_CLOSE".localized(), style: .default, handler: nil))
        self.present(message, animated: true)
    }
}

extension BookSectionViewController: BookSectionViewDelegate {
    func onRentPressed() {
        if _book.isAvailable() {
            print("RENT BOOK!")
        } else {
            unavailableBookAlert()
        }
    }
    
    func onAddWishlistPressed() {
        print("ADD TO WISHLIST!") // TODO
    }
}
