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
    private let unsplashAPIService: UnsplashAPIService
    
    var onImageUpdated: ((UIImage?) -> Void)?
    
    init(photo: PhotoUIModel, unsplashAPIService: UnsplashAPIService) {
        self.imageURL = photo.urls.small
        self.unsplashAPIService = unsplashAPIService
    }
    
    func loadImage() {
        Task {
            do {
                let data = try await unsplashAPIService.download(imageURL: imageURL)
                let image = UIImage(data: data) ?? UIImage(systemName: "photo")
                
                DispatchQueue.main.async { [weak self] in
                    self?.onImageUpdated?(image)
                }
            } catch {
                DispatchQueue.main.async { [weak self] in
                    self?.onImageUpdated?(UIImage(systemName: "photo"))
                }
            }
        }
    }
}
