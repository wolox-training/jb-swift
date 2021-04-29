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
        fixIn(tableViewController, into: libraryView.mainContainer)
    }

    private func configureNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "LIBRARY_LABEL".localized()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.notifications, style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.search, style: .plain, target: nil, action: nil)
        navigationItem.backButtonDisplayMode = UINavigationItem.BackButtonDisplayMode.minimal
    }
}
