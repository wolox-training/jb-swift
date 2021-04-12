//
//  MainMenuView.swift
//  WBooks
//
//  Created by joaquin bozzalla on 08/04/2021.
//

import UIKit

final class MainMenuView: NibView {
    @IBOutlet var view: UIView!
    @IBOutlet var tblBooks: UITableView! {
        didSet {
            tblBooks.layer.backgroundColor = UIColor.backgroundColor.cgColor
        }
    }
}
