//
//  SuggestionsView.swift
//  WBooks
//
//  Created by joaquin bozzalla on 21/04/2021.
//

import UIKit

final class SuggestionsView: NibView {
    @IBOutlet weak var view: UIView! {
        didSet {
            view.backgroundColor = UIColor.backgroundColor
        }
    }
    @IBOutlet weak var suggestionsCollection: UICollectionView! {
        didSet {
            suggestionsCollection.backgroundColor = UIColor.backgroundColor
        }
    }
    @IBOutlet weak var labelTitle: UILabel! {
        didSet {
            labelTitle.text = "SUGGESTIONS_TITLE".localized()
        }
    }
}
