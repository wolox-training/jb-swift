//
//  BookSectionView.swift
//  WBooks
//
//  Created by joaquin bozzalla on 13/04/2021.
//

import UIKit

protocol BookSectionViewDelegate: AnyObject {
    func onRentPressed()
    func onAddWishlistPressed()
}

final class BookSectionView: NibView {
    weak var delegate: BookSectionViewDelegate?
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var labelAvailability: UILabel!
    @IBOutlet weak var labelYear: UILabel!
    @IBOutlet weak var labelGenre: UILabel!
    @IBOutlet weak var imageBook: UIImageView!
    @IBOutlet weak var viewContainer: UIView! {
        didSet {
            viewContainer.makeCustomWhite()
        }
    }
    @IBOutlet weak var buttonAddToWishlist: UIButton! {
        didSet {
            buttonAddToWishlist.setTitle("ADD_TO_WISHLIST_BUTTON".localized(), for: .normal)
            buttonAddToWishlist.makeCustomOutlined()
        }
    }
    @IBOutlet weak var buttonRent: UIButton! {
        didSet {
            buttonRent.setTitle("RENT_BUTTON".localized(), for: .normal)
            buttonRent.makeCustomSolid()
        }
    }
    
    @IBAction func onRentPressed(_ sender: Any) {
        delegate?.onRentPressed()
    }
    
    func configure(with viewModel: BookSectionViewModel) {
        labelTitle.text = viewModel.title
        labelAuthor.text = viewModel.author
        labelGenre.text = viewModel.genre
        labelYear.text = viewModel.year
        imageBook.loadFromURL(stringURL: viewModel.imageURL)
        configureAvailability(viewModel.status)
    }
    
    func configureAvailability(_ status: BookStatus) {
        switch status {
        case .available:
            labelAvailability.text = "BOOK_AVAILABLE".localized()
            labelAvailability.textColor = .systemGreen
            buttonRent.isEnabled = true
        case .inYourHands:
            labelAvailability.text = "BOOK_IN_YOUR_HANDS".localized()
            labelAvailability.textColor = .red
            buttonRent.isEnabled = false
        default: // By default the book is unavailable
            labelAvailability.text = "BOOK_UNAVAILABLE".localized()
            labelAvailability.textColor = .red
            buttonRent.isEnabled = false
        }
    }
}
