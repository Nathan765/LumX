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

extension AppCoordinator: ImageGridCoordinator {}

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let imageGridVC = createImageGridViewController()
        navigationController.setViewControllers([imageGridVC], animated: false)
    }
    
    private func createImageGridViewController() -> ImageGridViewController {        
        let viewModel = Container.shared.imageGridViewModel()
        let vc = ImageGridViewController(viewModel: viewModel)
        vc.coordinator = self
        return vc
    }
    
    func showDetail(for photoId: String) { // TODO: Factory --> DI
        let networkService = URLSessionNetworkServiceImpl()
        let unsplashAPIService = UnsplashAPIServiceImpl(networkService: networkService)
        let photoDetailRemoteDataSource = PhotoDetailRemoteDataSourceImpl(unsplashAPIService: unsplashAPIService)
        let photoDetailRepository = PhotoDetailRepositoryImpl(photoDetailRemoteDataSource: photoDetailRemoteDataSource)
        let photoDetailUseCase = PhotoDetailUseCaseImpl(photoDetailRepository: photoDetailRepository)
        let viewModel = ImageDetailViewModel(photoDetailUseCase: photoDetailUseCase, photoId: photoId)
        let detailView = ImageDetailView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: detailView)
        navigationController.pushViewController(hostingController, animated: true)
    }
}
