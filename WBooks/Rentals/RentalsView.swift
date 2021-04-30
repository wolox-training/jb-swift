//
//  RentalsView.swift
//  WBooks
//
//  Created by joaquin bozzalla on 20/04/2021.
//

import UIKit

class RentalsView: NibView {
    @IBOutlet var view: UIStackView! {
        didSet {
            view.backgroundColor = UIColor.backgroundColor
        }
    }
    @IBOutlet var tableContainer: UIView! {
        didSet {
            tableContainer.backgroundColor = UIColor.backgroundColor
        }
    }
    @IBOutlet var suggestionsContainer: UIView! {
        didSet {
            suggestionsContainer.backgroundColor = UIColor.backgroundColor
        }
    }
}
