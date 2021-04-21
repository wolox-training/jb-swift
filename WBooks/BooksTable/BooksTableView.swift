//
//  BooksTableView.swift
//  WBooks
//
//  Created by joaquin bozzalla on 20/04/2021.
//

import UIKit

final class BooksTableView: NibView {
    @IBOutlet var booksTable: UITableView! {
        didSet {
            booksTable.backgroundColor = UIColor.backgroundColor
        }
    }
}
