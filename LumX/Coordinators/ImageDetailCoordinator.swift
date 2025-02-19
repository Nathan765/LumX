//
//  ImageDetailCoordinator.swift
//  LumX
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import SwiftUI

class ImageDetailCoordinator: Coordinator {
    var navigationController: UINavigationController
    private var photo: Photo

    init(navigationController: UINavigationController, photo: Photo) {
        self.navigationController = navigationController
        self.photo = photo
    }

    func start() {
        let viewModel = ImageDetailViewModel(photo: photo)
        let detailView = ImageDetailView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: detailView)
        navigationController.pushViewController(hostingController, animated: true)
    }
}
