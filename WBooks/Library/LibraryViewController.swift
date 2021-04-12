//
//  MainMenuViewController.swift
//  WBooks
//
//  Created by joaquin bozzalla on 08/04/2021.
//

import UIKit

final class LibraryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let mainMenuView = LibraryView()
    
    private let booksArray : Array = [
        ["title": "A little bird told me", "author": "Timothy Cross", "image": "img_book1"],
        ["title": "When the Doveeeeeeeeeees Disappeared", "author": "Sofi Oksanen", "image": "img_book2"],
        ["title": "The Best Book in the World", "author": "Peter Sjernstrom", "image": "img_book3"],
        ["title": "Be Creative", "author": "Tony Alcazar", "image": "img_book4"],
        ["title": "Redesign the Web", "author": "Liliana Castilla", "image": "img_book5"],
    ]
    
    override func loadView() {
        super.loadView()
        self.view = mainMenuView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainMenuView.tblBooks.delegate = self
        self.mainMenuView.tblBooks.dataSource = self
        let nib = UINib.init(nibName: "BookCellView", bundle: nil)
        self.mainMenuView.tblBooks.register(nib, forCellReuseIdentifier: "BookCellView")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return booksArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCellView", for: indexPath) as! BookCellView
        let dict = booksArray[indexPath.row]
        cell.lblTitle.text = dict["title"]
        cell.lblAuthor.text = dict["author"]
        if let image = dict["image"] {
            cell.imgBook.image = UIImage(named: image)
        }
        
        return cell
    }
}
