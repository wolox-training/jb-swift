//
//  BookCellView.swift
//  WBooks
//
//  Created by joaquin bozzalla on 08/04/2021.
//

import UIKit

final class BookCellView: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var imgBook: UIImageView!
    @IBOutlet weak var mainContainer: UIView! {
        didSet {
            mainContainer.layer.backgroundColor = UIColor.backgroundColor.cgColor
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 50, left: 50, bottom: 8, right: 50))
    }
}
