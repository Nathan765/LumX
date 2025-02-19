//
//  ImageGridViewModel.swift
//  LumX
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import Foundation

class ImageGridViewModel {
    private let service: UnsplashService
    private var currentPage = 1
    var photos: [Photo] = []
    var onImagesUpdated: (() -> Void)?

    init(service: UnsplashService = UnsplashService()) {
        self.service = service
    }
    
    func fetchImages() {
        service.fetchPhotos(page: currentPage, perPage: 20) { [weak self] result in
            switch result {
            case .success(let newPhotos):
                self?.photos.append(contentsOf: newPhotos)
                self?.onImagesUpdated?()
                self?.currentPage += 1
            case .failure(let error):
                print("❌ Error fetching images: \(error)")
            }
        }
    }
}
