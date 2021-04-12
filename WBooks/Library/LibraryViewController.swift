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
        ["title": "Redesign the Web", "author": "Liliana Castilla", "image": "img_book5"],
    ]
    
    override func loadView() {
        super.loadView()
        self.view = libraryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.libraryView.tableBooks.delegate = self
        self.libraryView.tableBooks.dataSource = self
        let nib = UINib.init(nibName: BookCellView.identifier, bundle: nil)
        self.libraryView.tableBooks.register(nib, forCellReuseIdentifier: BookCellView.identifier)
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
