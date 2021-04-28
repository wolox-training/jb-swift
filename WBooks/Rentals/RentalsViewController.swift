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
        configureNavigationBar()
        fixIn(tableViewController, into: rentalsView.mainContainer)
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "RENTALS_LABEL".localized()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.notifications, style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.search, style: .plain, target: nil, action: nil)
        navigationItem.backButtonDisplayMode = UINavigationItem.BackButtonDisplayMode.minimal
    }
}
