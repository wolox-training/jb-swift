//
//  MainMenuViewController.swift
//  WBooks
//
//  Created by joaquin bozzalla on 08/04/2021.
//

import UIKit

final class MainMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let mainMenuView = MainMenuView()
    
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
        
        // Navbar configuration
        navigationItem.leftBarButtonItem = createNotificationButton()
        navigationItem.rightBarButtonItem = createSearchButton()
        navigationItem.titleView = createNavBarTitle()
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
    
    private func createNotificationButton() -> UIBarButtonItem {
        let notificationImageView = UIImageView(image: UIImage.icNotifications)
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: notificationImageView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 18),
            NSLayoutConstraint(item: notificationImageView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 18)
        ])
        
        return UIBarButtonItem(customView: notificationImageView)
    }
    
    private func createSearchButton() -> UIBarButtonItem {
        let notificationImageView = UIImageView(image: UIImage.icSearch)
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: notificationImageView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 18),
            NSLayoutConstraint(item: notificationImageView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 18)
        ])
        
        return UIBarButtonItem(customView: notificationImageView)
    }
    
    private func createNavBarTitle() -> UILabel {
        let navBarTitle = UILabel()
        navBarTitle.frame = CGRect(x: 156, y: 42, width: 64, height: 20)
        navBarTitle.lineBreakMode = .byWordWrapping
        navBarTitle.numberOfLines = 0
        navBarTitle.textColor = .white
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 1.1764705882352942
        paragraphStyle.alignment = .center
        navBarTitle.text = "LIBRARY_LABEL".localized()
        navBarTitle.sizeToFit()
        
        return navBarTitle
    }
}
