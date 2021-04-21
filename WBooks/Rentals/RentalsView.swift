//
//  RentalsView.swift
//  WBooks
//
//  Created by joaquin bozzalla on 20/04/2021.
//

import UIKit

class RentalsView: NibView {
    @IBOutlet var view: UIView! {
        didSet {
            view.backgroundColor = UIColor.backgroundColor
        }
    }
    @IBOutlet var mainContainer: UIView!
}
