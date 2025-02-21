//
//  AppCoordinator.swift
//  LumX
//
//  Created by Nathan Stéphant on 19/02/2025.
//

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
        let service = UnsplashNetworkServiceImpl()
        let photoRemoteDataSource = PhotoRemoteDataSourceImpl(unsplashNetworkService: service)
        let photoRepository = PhotoRepositoryImpl(photoRemoteDataSource: photoRemoteDataSource)
        let photoListUseCase = PhotoListUseCaseImpl(photoRepository: photoRepository)
        
        let viewModel = ImageGridViewModel(photoListUseCase: photoListUseCase)
        
        let vc = ImageGridViewController(viewModel: viewModel, service: service)
        vc.coordinator = self
        return vc
    }
    
    func showDetail(for photo: PhotoUIModel) {
//        let viewModel = ImageDetailViewModel(photo: photo)
//        let detailView = ImageDetailView(viewModel: viewModel)
//        let hostingController = UIHostingController(rootView: detailView)
//        navigationController.pushViewController(hostingController, animated: true)
    }
}
