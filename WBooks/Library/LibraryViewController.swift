//
//  MainMenuViewController.swift
//  WBooks
//
//  Created by joaquin bozzalla on 08/04/2021.
//

import UIKit

final class LibraryViewController: UIViewController {
    private let libraryView = LibraryView()
    private var tableViewController = BooksTableViewController(viewModel: LibraryViewModel())

    override func loadView() {
        super.loadView()
        self.view = libraryView
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
        libraryView.mainContainer.addSubview(tableViewController.view)
        
        libraryView.mainContainer.translatesAutoresizingMaskIntoConstraints = false
        tableViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            libraryView.mainContainer.topAnchor.constraint(equalTo: tableViewController.view.topAnchor),
            libraryView.mainContainer.bottomAnchor.constraint(equalTo: tableViewController.view.bottomAnchor),
            libraryView.mainContainer.leadingAnchor.constraint(equalTo: tableViewController.view.leadingAnchor),
            libraryView.mainContainer.trailingAnchor.constraint(equalTo: tableViewController.view.trailingAnchor)
        ])
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "LIBRARY_LABEL".localized()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.notifications, style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.search, style: .plain, target: nil, action: nil)
        navigationItem.backButtonDisplayMode = UINavigationItem.BackButtonDisplayMode.minimal
    }
}
