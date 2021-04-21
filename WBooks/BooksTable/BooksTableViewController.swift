//
//  BooksTableViewController.swift
//  WBooks
//
//  Created by joaquin bozzalla on 20/04/2021.
//

import UIKit

final class BooksTableViewController: UIViewController {
    private let booksTableView = BooksTableView()
    private let viewModel: BooksTableViewModelType
    
    init(viewModel: BooksTableViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = booksTableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        loadData()
    }
    
    private func loadData() {
        viewModel.fetchData(onSuccess: { [weak self] in self?.reloadTable() }, onError: { [weak self] _ in self?.showError() })
    }
    
    private func reloadTable() {
        booksTableView.booksTable.reloadData()
    }
    
    private func configureTable() {
        booksTableView.booksTable.delegate = self
        booksTableView.booksTable.dataSource = self
        let nib = UINib(nibName: BookCellView.identifier, bundle: nil)
        booksTableView.booksTable.register(nib, forCellReuseIdentifier: BookCellView.identifier)
    }
    
    private func showError() {
        showAlert(title: "ERROR_ALERT_TITLE".localized(), message: "ERROR_ALERT_MESSAGE".localized(), closeButtonLabel: "ERROR_ALERT_CLOSE".localized())
    }
}

extension BooksTableViewController: UITableViewDelegate, UITableViewDataSource {
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
        let book = viewModel.getBookBy(index: indexPath.row)
        let bookDetailsViewController = BookDetailsViewController(book: book)
        bookDetailsViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(bookDetailsViewController, animated: true)
    }
}
