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
    private let suggestionsController = SuggestionsViewController()
    
    override func loadView() {
        super.loadView()
        view = rentalsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        addTableToView()
        addSuggestionsToView()
    }
    
    private func addSuggestionsToView() {
        suggestionsController.willMove(toParent: self)
        addChild(suggestionsController)
        suggestionsController.didMove(toParent: self)
        rentalsView.suggestionsContainer.addSubview(suggestionsController.view)
        
        rentalsView.suggestionsContainer.translatesAutoresizingMaskIntoConstraints = false
        suggestionsController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rentalsView.suggestionsContainer.topAnchor.constraint(equalTo: suggestionsController.view.topAnchor),
            rentalsView.suggestionsContainer.bottomAnchor.constraint(equalTo: suggestionsController.view.bottomAnchor),
            suggestionsController.view.leadingAnchor.constraint(equalTo: rentalsView.suggestionsContainer.leadingAnchor, constant: 15.0),
            suggestionsController.view.trailingAnchor.constraint(equalTo: rentalsView.suggestionsContainer.trailingAnchor, constant: -15.0),
        ])
    }
    
    private func addTableToView() {
        tableViewController.willMove(toParent: self)
        addChild(tableViewController)
        tableViewController.didMove(toParent: self)
        rentalsView.tableContainer.addSubview(tableViewController.view)
        
        rentalsView.tableContainer.translatesAutoresizingMaskIntoConstraints = false
        tableViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rentalsView.tableContainer.topAnchor.constraint(equalTo: tableViewController.view.topAnchor),
            rentalsView.tableContainer.bottomAnchor.constraint(equalTo: tableViewController.view.bottomAnchor),
            rentalsView.tableContainer.leadingAnchor.constraint(equalTo: tableViewController.view.leadingAnchor),
            rentalsView.tableContainer.trailingAnchor.constraint(equalTo: tableViewController.view.trailingAnchor)
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
