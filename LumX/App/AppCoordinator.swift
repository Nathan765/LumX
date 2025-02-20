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
        imageGridCoordinator = ImageGridCoordinator(navigationController: navigationController)
        imageGridCoordinator?.start()
    }
}
