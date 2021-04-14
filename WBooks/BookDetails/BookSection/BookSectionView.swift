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
    
    @IBAction func onRentPressed(_ sender: Any) {
        delegate?.onRentPressed()
    }
}
