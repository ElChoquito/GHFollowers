//
//  GFTabBarController.swift
//  GHFollowers
//
//  Created by Sylvain Guillier on 20/11/2020.
//  Copyright © 2020 Sylvain Guillier. All rights reserved.
//

import UIKit

class GFTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemGreen
        viewControllers = [createSearchNavigationController(), createFavoritesNavigationController()]
    }
    
    func createSearchNavigationController() -> UINavigationController {
        let searchViewController = SearchViewController()
        searchViewController.tabBarItem = .init(tabBarSystemItem: .search, tag: 0)
        return UINavigationController(rootViewController: searchViewController)
    }
    
    func createFavoritesNavigationController() -> UINavigationController {
        let favoritesListViewController = FavoritesListViewController()
        favoritesListViewController.tabBarItem = .init(tabBarSystemItem: .favorites, tag: 1)
        return UINavigationController(rootViewController: favoritesListViewController)
    }
}
