//
//  MainMenuViewController.swift
//  WBooks
//
//  Created by joaquin bozzalla on 08/04/2021.
//

import UIKit

class MainMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let mainMenuView = MainMenuView()
    
    
    var booksArray : Array = [["title": "book 1", "author": "author 1", "image": "img_book1"], ["title": "book 2", "author": "author 2", "image": "img_book2"], ["title": "book 3", "author": "author 3", "image": "img_book3"]]
    
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
