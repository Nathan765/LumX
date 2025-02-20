//
//  ImageGridCoordinator.swift
//  LumX
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import UIKit

class ImageGridCoordinator: Coordinator {
    var navigationController: UINavigationController
    private var imageDetailCoordinator: ImageDetailCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let imageGridVC = createImageGridViewController()
        navigationController.setViewControllers([imageGridVC], animated: false)
    }

    private func createImageGridViewController() -> ImageGridViewController {
        let viewModel = ImageGridViewModel()
        return ImageGridViewController(viewModel: viewModel, coordinator: self)
    }

    func showDetail(for photo: Photo) {
        imageDetailCoordinator = ImageDetailCoordinator(navigationController: navigationController, photo: photo)
        imageDetailCoordinator?.start()
    }
}
