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
        setupUI()
    }

    private func setupUI() {
        self.view.backgroundColor = .systemGray6
        self.tabBar.backgroundColor = .systemGray6
        self.tabBar.tintColor = .gray
        self.tabBar.unselectedItemTintColor = .darkGray
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.backgroundColor = .systemGray6
//        self.tabBar.backgroundColor = .systemGray6
//        self.tabBar.tintColor = .gray
//        self.tabBar.unselectedItemTintColor = .darkGray
//        
//        let homeSceneNavigationController = UINavigationController(rootViewController: ImageGridViewController())
//        let homeTabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
//        homeSceneNavigationController.tabBarItem = homeTabBarItem
//        self.viewControllers?.append(homeSceneNavigationController)
        
//        let searchSceneNavigationController = UINavigationController(rootViewController: SearchSceneController())
//        let searchTabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass.circle.fill"))
//        searchSceneNavigationController.tabBarItem = searchTabBarItem
//        self.viewControllers?.append(searchSceneNavigationController)
//        
//        let favoritesSceneNavigationController = UINavigationController(rootViewController: FavoritesSceneController())
//        let favoritesTabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
//        favoritesSceneNavigationController.tabBarItem = favoritesTabBarItem
//        self.viewControllers?.append(favoritesSceneNavigationController)
//        
//        let accountSceneNavigationController = UINavigationController(rootViewController: AccountSceneController())
//        let accountTabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
//        accountSceneNavigationController.tabBarItem = accountTabBarItem
//        self.viewControllers?.append(accountSceneNavigationController)
//    }
}
