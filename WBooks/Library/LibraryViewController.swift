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
        ["title": "book 1", "author": "author 1", "image": "img_book1"],
        ["title": "book 2", "author": "author 2", "image": "img_book2"],
        ["title": "book 3", "author": "author 3", "image": "img_book3"]
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
        cell.labelTitle.text = dict["title"]
        cell.labelAuthor.text = dict["author"]
        if let image = dict["image"] {
            cell.imageBook.image = UIImage(named: image)
        }
        
        return cell
    }
}
