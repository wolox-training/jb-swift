//
//  BookCellView.swift
//  WBooks
//
//  Created by joaquin bozzalla on 08/04/2021.
//

import UIKit

class BookCellView: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var imgBook: UIImageView!
    @IBOutlet weak var whiteContainer: UIView! {
        didSet {
            whiteContainer.layer.cornerRadius = 5.0
            whiteContainer.layer.shadowColor = UIColor.systemGray.cgColor
            whiteContainer.layer.shadowOpacity = 0.4
            whiteContainer.layer.shadowOffset = .zero
            whiteContainer.layer.shadowRadius = 1
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 50, left: 50, bottom: 8, right: 50))
    }

}
