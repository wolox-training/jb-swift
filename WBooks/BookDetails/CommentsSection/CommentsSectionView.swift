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
            viewContainer.makeCustomWhite()
        }
    }
}
