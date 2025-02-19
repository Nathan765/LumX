//
//  AppCoordinator.swift
//  LumX
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    private var imageGridCoordinator: ImageGridCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let tabBarController = TabBarScene()

        let imageGridNav = UINavigationController()
        imageGridCoordinator = ImageGridCoordinator(navigationController: imageGridNav)
        imageGridCoordinator?.start()

        tabBarController.setViewControllers([
            imageGridNav,
            createPlaceholderNavController(title: "Recherche", image: "magnifyingglass"),
            createPlaceholderNavController(title: "Favoris", image: "star"),
            createPlaceholderNavController(title: "Compte", image: "person")
        ], animated: false)

        navigationController.setViewControllers([tabBarController], animated: false)
    }

    private func createPlaceholderNavController(title: String, image: String) -> UINavigationController {
        let vc = UIViewController()
        vc.view.backgroundColor = .systemBackground
        vc.navigationItem.title = title
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: image), selectedImage: UIImage(systemName: "\(image).fill"))
        return navController
    }
}
