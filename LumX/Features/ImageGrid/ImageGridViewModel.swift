//
//  ImageGridViewModel.swift
//  LumX
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import Foundation
import NetworkingModule

class ImageGridViewModel {
    private let service: UnsplashService
    private var currentPage = 1
    private var isLoading = false
    var photos: [Photo] = []
    var onImagesUpdated: (() -> Void)?

    init(service: UnsplashService = UnsplashService()) {
        self.service = service
    }
    
    func fetchImages() {
        guard !isLoading else { return }
        isLoading = true
        
        service.fetchPhotos(page: currentPage, perPage: 30) { [weak self] result in
            guard let self = self else { return }
            self.isLoading = false

            switch result {
            case .success(let newPhotos):
                let uniquePhotos = newPhotos.filter { newPhoto in
                    !self.photos.contains(where: { $0.id == newPhoto.id })
                }
                
                guard !uniquePhotos.isEmpty else { return }
                
                self.photos.append(contentsOf: uniquePhotos)
                self.currentPage += 1
                self.onImagesUpdated?()
            case .failure(let error):
                print("❌ Error fetching images: \(error)")
            }
        }
    }
}
