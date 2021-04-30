//
//  SuggestionCellView.swift
//  WBooks
//
//  Created by joaquin bozzalla on 22/04/2021.
//

import UIKit

final class SuggestionCellView: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    
    static var identifier: String {
        return String(describing: SuggestionCellView.self)
    }
    
    func configureCell(with viewModel: SuggestionCellViewModel) {
        image.loadFromURL(stringURL: viewModel.imageURL)
    }
}
