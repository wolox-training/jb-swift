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
            viewContainer.layer.cornerRadius = 5.0
            viewContainer.layer.shadowColor = UIColor.systemGray.cgColor
            viewContainer.layer.shadowOpacity = 0.4
            viewContainer.layer.shadowOffset = .zero
            viewContainer.layer.shadowRadius = 1
        }
    }
    @IBOutlet weak var buttonAddToWishlist: UIButton! {
        didSet {
            buttonAddToWishlist.setTitle("ADD_TO_WISHLIST_BUTTON".localized(), for: .normal)
        }
    }
    @IBOutlet weak var buttonRent: UIButton! {
        didSet {
            buttonRent.setTitle("RENT_BUTTON".localized(), for: .normal)
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
        configureAvailability(viewModel.isBookAvailable)
    }
    
    func configureAvailability(_ value: Bool) {
        labelAvailability.text = value ? "BOOK_AVAILABLE".localized() : "BOOK_UNAVAILABLE".localized()
        labelAvailability.textColor = value ? .systemGreen : .systemRed
        buttonRent.isEnabled = value
    }
}
