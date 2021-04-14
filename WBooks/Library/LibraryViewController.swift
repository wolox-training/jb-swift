//
//  MainMenuViewController.swift
//  WBooks
//
//  Created by joaquin bozzalla on 08/04/2021.
//

import UIKit

final class LibraryViewController: UIViewController {
    private let libraryView = LibraryView()
    private let viewModel = LibraryViewModel()
    
    override func loadView() {
        super.loadView()
        self.view = libraryView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        configureNavigationBar()
    }

    private func configureTable() {
        self.libraryView.tableBooks.delegate = self
        self.libraryView.tableBooks.dataSource = self
        let nib = UINib.init(nibName: BookCellView.identifier, bundle: nil)
        self.libraryView.tableBooks.register(nib, forCellReuseIdentifier: BookCellView.identifier)
    }

    private func configureNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "LIBRARY_LABEL".localized()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.notifications, style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.search, style: .plain, target: nil, action: nil)
    }
}

extension LibraryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfBooks
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookCellView.identifier, for: indexPath) as! BookCellView
        let bookCellViewModel = viewModel.createBookCellViewModel(for:indexPath.row)
        cell.configureCell(with: bookCellViewModel)
        return cell
    }
}
