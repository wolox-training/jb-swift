//
//  MainMenuViewController.swift
//  WBooks
//
//  Created by joaquin bozzalla on 08/04/2021.
//

import UIKit

class MainMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let mainMenuView = MainMenuView()
    
    var booksArray : Array = [
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
        let notificationImageView = UIImageView(image: UIImage(named: "ic_notifications"))

        let widthConstraint = NSLayoutConstraint(item: notificationImageView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 18)
        let heightConstraint = NSLayoutConstraint(item: notificationImageView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 18)
        
        notificationImageView.addConstraints([widthConstraint, heightConstraint])
        
        return UIBarButtonItem(customView: notificationImageView)
    }
    
    private func createSearchButton() -> UIBarButtonItem {
        let notificationImageView = UIImageView(image: UIImage(named: "ic_search"))
        
        let widthConstraint = NSLayoutConstraint(item: notificationImageView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 18)
        let heightConstraint = NSLayoutConstraint(item: notificationImageView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 18)
        
        notificationImageView.addConstraints([widthConstraint, heightConstraint])
        
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
        navBarTitle.text = NSLocalizedString("LIBRARY_LABEL", comment: "")
        navBarTitle.sizeToFit()
        
        return navBarTitle
    }
}
