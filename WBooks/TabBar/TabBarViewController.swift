//
//  TabBarControllerViewController.swift
//  WBooks
//
//  Created by joaquin bozzalla on 09/04/2021.
//

import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navbar configuration
        navigationItem.leftBarButtonItem = createNotificationButton()
        navigationItem.rightBarButtonItem = createSearchButton()
        navigationItem.titleView = createNavBarTitle()
        
        // TabBar configuration
        let home = LibraryViewController()
        home.tabBarItem = UITabBarItem()
        home.tabBarItem.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0);
        home.tabBarItem.title = NSLocalizedString("LIBRARY_TABBAR", comment: "")
        home.tabBarItem.image = UIImage(named: "ic_library")
        home.tabBarItem.tag = 0
        
        let wishList = UIViewController()
        wishList.tabBarItem = UITabBarItem()
        wishList.tabBarItem.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0);
        wishList.tabBarItem.title = NSLocalizedString("WISHLIST_TABBAR", comment: "")
        wishList.tabBarItem.image = UIImage(named: "ic_wishlist")
        wishList.tabBarItem.tag = 1
        
        let addNew = UIViewController()
        addNew.tabBarItem = UITabBarItem()
        addNew.tabBarItem.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0);
        addNew.tabBarItem.title = NSLocalizedString("ADDNEW_TABBAR", comment: "")
        addNew.tabBarItem.image = UIImage(named: "ic_add new")
        addNew.tabBarItem.tag = 2
        
        let rentals = UIViewController()
        rentals.tabBarItem = UITabBarItem()
        rentals.tabBarItem.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0);
        rentals.tabBarItem.title = NSLocalizedString("MYRENTALS_TABBAR", comment: "")
        rentals.tabBarItem.image = UIImage(named: "ic_myrentals")
        rentals.tabBarItem.tag = 3
        
        let settings = UIViewController()
        settings.tabBarItem = UITabBarItem()
        settings.tabBarItem.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0);
        settings.tabBarItem.title = NSLocalizedString("SETTINGS_TABBAR", comment: "")
        settings.tabBarItem.image = UIImage(named: "ic_settings")
        settings.tabBarItem.tag = 4
        
        viewControllers = [home, wishList, addNew, rentals, settings]
        tabBar.barTintColor = .white
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
