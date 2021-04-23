//
//  CommentsSectionView.swift
//  WBooks
//
//  Created by joaquin bozzalla on 13/04/2021.
//

import UIKit

final class CommentsSectionView: NibView {
    @IBOutlet weak var tableComments: UITableView!
    @IBOutlet weak var viewContainer: UIView! {
        didSet {
            viewContainer.backgroundColor = .white
            viewContainer.layer.cornerRadius = 5.0
            viewContainer.layer.shadowColor = UIColor.systemGray.cgColor
            viewContainer.layer.shadowOpacity = 0.4
            viewContainer.layer.shadowOffset = .zero
            viewContainer.layer.shadowRadius = 1
        }
    }
}
