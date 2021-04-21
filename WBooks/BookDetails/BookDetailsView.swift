//
//  BookDetailsView.swift
//  WBooks
//
//  Created by joaquin bozzalla on 13/04/2021.
//

import UIKit

final class BookDetailsView: NibView {
    @IBOutlet weak var sectionsContainer: UIStackView!
    @IBOutlet weak var mainContainer: UIView! {
        didSet {
            mainContainer.backgroundColor = UIColor.backgroundColor
        }
    }
}
