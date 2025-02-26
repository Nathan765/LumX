//
//  PhotoGalleryCellViewModel.swift
//  PhotoGalleryFeature
//
//  Created by Nathan Stéphant on 21/02/2025.
//

import UIKit

public class PhotoGalleryCellViewModel {
    private let imageURL: String
    private let photoDownloadUseCase: PhotoDownloadImageUseCase
    
    var onImageUpdated: ((UIImage?) -> Void)?
    
    public init(photo: PhotoUIModel, photoDownloadUseCase: PhotoDownloadImageUseCase) {
        self.imageURL = photo.urls.small
        self.photoDownloadUseCase = photoDownloadUseCase
    }
    
    func loadImage() {
        Task {
            do {
                let data = try await self.photoDownloadUseCase.execute(imageURL: self.imageURL)
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
