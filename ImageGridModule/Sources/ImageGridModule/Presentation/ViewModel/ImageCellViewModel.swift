//
//  ImageCellViewModel.swift
//  ImageGridModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

import UIKit
import NetworkingModule

class ImageCellViewModel {
    private let imageURL: String
    private let service: UnsplashNetworkService

    var onImageUpdated: ((UIImage?) -> Void)?

    init(photo: Photo, service: UnsplashNetworkService) {
        self.imageURL = photo.urls.small
        self.service = service
    }

    func loadImage() {
        service.download(imageURL: imageURL) { [weak self] data in
            guard let self = self else { return }
            if let data = data, let image = UIImage(data: data) {
                self.onImageUpdated?(image)
            } else {
                self.onImageUpdated?(UIImage(systemName: "photo"))
            }
        }
    }
}
