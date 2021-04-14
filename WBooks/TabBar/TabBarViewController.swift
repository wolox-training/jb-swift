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

        // TabBar configuration
        let home = UINavigationController(rootViewController: LibraryViewController())
        home.tabBarItem = UITabBarItem()
        home.tabBarItem.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0);
        home.tabBarItem.title = "LIBRARY_TABBAR".localized()
        home.tabBarItem.image = UIImage.library
        home.tabBarItem.tag = 0
        
        let wishList = UIViewController()
        wishList.tabBarItem = UITabBarItem()
        wishList.tabBarItem.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0);
        wishList.tabBarItem.title = "WISHLIST_TABBAR".localized()
        wishList.tabBarItem.image = UIImage.wishlist
        wishList.tabBarItem.tag = 1

        let addNew = UIViewController()
        addNew.tabBarItem = UITabBarItem()
        addNew.tabBarItem.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0);
        addNew.tabBarItem.title = "ADDNEW_TABBAR".localized()
        addNew.tabBarItem.image = UIImage.addNew
        addNew.tabBarItem.tag = 2
        
        let rentals = UIViewController()
        rentals.tabBarItem = UITabBarItem()
        rentals.tabBarItem.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0);
        rentals.tabBarItem.title = "MYRENTALS_TABBAR".localized()
        rentals.tabBarItem.image = UIImage.myRentals
        rentals.tabBarItem.tag = 3
        
        let settings = UIViewController()
        settings.tabBarItem = UITabBarItem()
        settings.tabBarItem.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0);
        settings.tabBarItem.title = "SETTINGS_TABBAR".localized()
        settings.tabBarItem.image = UIImage.settings
        settings.tabBarItem.tag = 4
        
        viewControllers = [home, wishList, addNew, rentals, settings]
        tabBar.barTintColor = .white
    }
    
    private func createNotificationButton() -> UIBarButtonItem {
        let notificationImageView = UIImageView(image: UIImage.notifications)
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: notificationImageView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 18),
            NSLayoutConstraint(item: notificationImageView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 18)
        ])
        
        return UIBarButtonItem(customView: notificationImageView)
    }
    
    private func createSearchButton() -> UIBarButtonItem {
        let notificationImageView = UIImageView(image: UIImage.search)
        
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
