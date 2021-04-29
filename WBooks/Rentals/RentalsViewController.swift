//
//  RentalsViewController.swift
//  WBooks
//
//  Created by joaquin bozzalla on 20/04/2021.
//

import UIKit

final class RentalsViewController: UIViewController {
    private let rentalsView = RentalsView()
    private var tableViewController = BooksTableViewController(viewModel: RentalsViewModel())
    
    override func loadView() {
        super.loadView()
        view = rentalsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar(title: "RENTALS_LABEL".localized())
        fixIn(tableViewController, into: rentalsView.mainContainer)
    }
}
