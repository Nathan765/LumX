//
//  AppCoordinator.swift
//  LumX
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import Factory
import SwiftUI
import NetworkingModule
import ImageDetailModule
import ImageGridModule

protocol AppCoordinatorProtocol: Coordinator, ImageGridCoordinator {
    func showDetail(for photoId: String)
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
    
    func showDetail(for photoId: String) { // TODO: Factory --> DI
        let photoDetailUseCase =  Container.shared.photoDetailUseCase()
        let viewModel = ImageDetailViewModel(photoDetailUseCase: photoDetailUseCase, photoId: photoId)
        let detailView = ImageDetailView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: detailView)
        navigationController.pushViewController(hostingController, animated: true)
    }
}
