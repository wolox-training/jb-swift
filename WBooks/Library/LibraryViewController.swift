//
//  MainMenuViewController.swift
//  WBooks
//
//  Created by joaquin bozzalla on 08/04/2021.
//

import UIKit

final class LibraryViewController: UIViewController {
    private let libraryView = LibraryView()

    private let booksArray : Array = [
        ["title": "A little bird told me", "author": "Timothy Cross", "image": "img_book1"],
        ["title": "When the Doveeeeeeeeeees Disappeared", "author": "Sofi Oksanen", "image": "img_book2"],
        ["title": "The Best Book in the World", "author": "Peter Sjernstrom", "image": "img_book3"],
        ["title": "Be Creative", "author": "Tony Alcazar", "image": "img_book4"],
        ["title": "Redesign the Web", "author": "Liliana Castilla", "image": ""],
    ]

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
        return booksArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookCellView.identifier, for: indexPath) as! BookCellView
        let dict = booksArray[indexPath.row]
        cell.configureCell(title: dict["title"]!, author: dict["author"]!, image: dict["image"]!)

        return cell
    }
}
