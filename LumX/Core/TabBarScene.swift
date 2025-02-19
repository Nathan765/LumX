//
//  TabBarScene.swift
//  LumX
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import UIKit

class TabBarScene: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        self.tabBar.backgroundColor = .systemGray6
        self.tabBar.tintColor = .gray
        self.tabBar.unselectedItemTintColor = .darkGray
        
        let homeSceneNavigationController = UINavigationController(rootViewController: HomeSceneController())
        let homeTabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        homeSceneNavigationController.tabBarItem = homeTabBarItem
        
        let searchSceneNavigationController = UINavigationController(rootViewController: SearchSceneController())
        let searchTabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass.circle.fill"))
        searchSceneNavigationController.tabBarItem = searchTabBarItem
        
        let favoritesSceneNavigationController = UINavigationController(rootViewController: FavoritesSceneController())
        let favoritesTabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
        favoritesSceneNavigationController.tabBarItem = favoritesTabBarItem
        
        let accountSceneNavigationController = UINavigationController(rootViewController: AccountSceneController())
        let accountTabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        accountSceneNavigationController.tabBarItem = accountTabBarItem
        
        self.viewControllers = [homeSceneNavigationController,
                                searchSceneNavigationController,
                                favoritesSceneNavigationController,
                                accountSceneNavigationController
        ]
    }
}
