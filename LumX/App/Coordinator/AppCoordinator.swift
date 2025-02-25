//
//  AppCoordinator.swift
//  LumX
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import SwiftUI
import ImageGridModule
import PhotoDetailsFeature
import NetworkingModule
import Factory

protocol AppCoordinatorProtocol: Coordinator, ImageGridCoordinator {
    func showPhotoDetails(for photoId: String)
}

class AppCoordinator: AppCoordinatorProtocol {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showImageGrid()
    }
    
    private func showImageGrid() {
        let imageGridViewController = ImageGridViewController(
            coordinator: self,
            imageGridViewModel: Container.shared.imageGridViewModel(),
            imageCellViewModelProvider: Container.shared.imageCellViewModelProvider)
        navigationController.setViewControllers([imageGridViewController], animated: false)
    }
    
    func showPhotoDetails(for photoId: String) {
        let viewModel = Container.shared.photoDetailsViewModel(photoId)
        let detailView = PhotoDetailsView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: detailView)
        navigationController.pushViewController(hostingController, animated: true)
    }
}
