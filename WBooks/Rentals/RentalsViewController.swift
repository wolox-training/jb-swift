//
//  RentalsViewController.swift
//  WBooks
//
//  Created by joaquin bozzalla on 20/04/2021.
//

import UIKit

final class RentalsViewController: UIViewController {
    private let rentalsView = RentalsView()
    private let tableViewController = BooksTableViewController(viewModel: RentalsViewModel())
    private let suggestionsController = SuggestionsViewController()
    
    override func loadView() {
        super.loadView()
        view = rentalsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar(title: "RENTALS_LABEL".localized())
        // Adding table and suggestions views
        fixIn(tableViewController, into: rentalsView.tableContainer)
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
}
