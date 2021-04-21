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
        addTableToView()
    }
    
    private func addTableToView() {
        tableViewController.willMove(toParent: self)
        addChild(tableViewController)
        tableViewController.didMove(toParent: self)
        rentalsView.mainContainer.addSubview(tableViewController.view)
        
        rentalsView.mainContainer.translatesAutoresizingMaskIntoConstraints = false
        tableViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rentalsView.mainContainer.topAnchor.constraint(equalTo: tableViewController.view.topAnchor),
            rentalsView.mainContainer.bottomAnchor.constraint(equalTo: tableViewController.view.bottomAnchor),
            rentalsView.mainContainer.leadingAnchor.constraint(equalTo: tableViewController.view.leadingAnchor),
            rentalsView.mainContainer.trailingAnchor.constraint(equalTo: tableViewController.view.trailingAnchor)
        ])
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "RENTALS_LABEL".localized()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.notifications, style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.search, style: .plain, target: nil, action: nil)
        navigationItem.backButtonDisplayMode = UINavigationItem.BackButtonDisplayMode.minimal
    }
}
