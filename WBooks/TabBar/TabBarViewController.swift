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
        let home = UINavigationController(rootViewController:LibraryViewController())
        home.tabBarItem = UITabBarItem()
        home.tabBarItem.title = "LIBRARY_TABBAR".localized()
        home.tabBarItem.image = UIImage.library
        home.tabBarItem.tag = 0
        
        let wishList = UIViewController()
        wishList.tabBarItem = UITabBarItem()
        wishList.tabBarItem.title = "WISHLIST_TABBAR".localized()
        wishList.tabBarItem.image = UIImage.wishlist
        wishList.tabBarItem.tag = 1

        let addNew = UIViewController()
        addNew.tabBarItem = UITabBarItem()
        addNew.tabBarItem.title = "ADDNEW_TABBAR".localized()
        addNew.tabBarItem.image = UIImage.addNew
        addNew.tabBarItem.tag = 2
        
        let rentals = UIViewController()
        rentals.tabBarItem = UITabBarItem()
        rentals.tabBarItem.title = "MYRENTALS_TABBAR".localized()
        rentals.tabBarItem.image = UIImage.myRentals
        rentals.tabBarItem.tag = 3
        
        let settings = UIViewController()
        settings.tabBarItem = UITabBarItem()
        settings.tabBarItem.title = "SETTINGS_TABBAR".localized()
        settings.tabBarItem.image = UIImage.settings
        settings.tabBarItem.tag = 4
        
        viewControllers = [home, wishList, addNew, rentals, settings]
        tabBar.barTintColor = .white
    }
}
