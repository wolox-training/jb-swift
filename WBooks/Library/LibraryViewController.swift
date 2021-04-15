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
        loadBooks()
        configureNavigationBar()
    }

    private func configureTable() {
        self.libraryView.tableBooks.delegate = self
        self.libraryView.tableBooks.dataSource = self
        let nib = UINib.init(nibName: BookCellView.identifier, bundle: nil)
        self.libraryView.tableBooks.register(nib, forCellReuseIdentifier: BookCellView.identifier)
    }
    
    private func loadBooks() {
        viewModel.fetchBooks(onSuccess: self.reloadTable, onError: self.showError)
    }
    
    private func reloadTable() {
        self.libraryView.tableBooks.reloadData()
    }

    private func showError(error: Error) {
        let message = UIAlertController(title: "ERROR_ALERT_TITLE".localized(), message: "ERROR_ALERT_MESSAGE".localized(), preferredStyle: .alert)
        message.addAction(UIAlertAction(title: "ERROR_ALERT_CLOSE".localized(), style: .default, handler: nil))
        self.present(message, animated: true)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookCellView.identifier, for: indexPath) as! BookCellView
        let image = cell.imageBook.image
        let book = viewModel.getBookBy(index: indexPath.row)
        
        let bookDetailsViewController = UINavigationController(rootViewController: BookDetailsViewController(book: book, bookImage: image))
        bookDetailsViewController.modalPresentationStyle = .fullScreen
        present(bookDetailsViewController, animated: true)
    }
}
