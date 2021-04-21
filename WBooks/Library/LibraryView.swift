//
//  MainMenuView.swift
//  WBooks
//
//  Created by joaquin bozzalla on 08/04/2021.
//

import UIKit

final class LibraryView: NibView {
    @IBOutlet var view: UIView! {
        didSet {
            view.backgroundColor = UIColor.backgroundColor
        }
    }
    @IBOutlet var mainContainer: UIView!
}
