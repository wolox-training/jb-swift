//
//  BookCellView.swift
//  WBooks
//
//  Created by joaquin bozzalla on 08/04/2021.
//

import UIKit

final class BookCellView: UITableViewCell {
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var imageBook: UIImageView!
    @IBOutlet weak var mainContainer: UIView! {
        didSet {
            mainContainer.backgroundColor = UIColor.backgroundColor
        }
    }
    @IBOutlet weak var whiteContainer: UIView! {
        didSet {
            whiteContainer.layer.cornerRadius = 5.0
            whiteContainer.layer.shadowColor = UIColor.systemGray.cgColor
            whiteContainer.layer.shadowOpacity = 0.4
            whiteContainer.layer.shadowOffset = .zero
            whiteContainer.layer.shadowRadius = 1
        }
    }
    
    static var identifier: String {
        return String(describing: BookCellView.self)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 50, left: 50, bottom: 8, right: 50))
    }
    
    func configureCell(with viewModel: BookCellViewModel) {
        labelTitle.text =  viewModel.title
        labelAuthor.text = viewModel.author
        imageBook.loadFromURL(stringURL: viewModel.image)
    }
}
