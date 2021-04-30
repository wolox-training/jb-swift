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
        configureNavigationBar(title: "LIBRARY_LABEL".localized())
        fixIn(tableViewController, into: libraryView.mainContainer)
    }
}
