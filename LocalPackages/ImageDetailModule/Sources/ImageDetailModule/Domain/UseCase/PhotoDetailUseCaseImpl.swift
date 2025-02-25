//
//  PhotoDetailUseCaseImpl.swift
//  ImageDetailModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

import Entities
import DataModule

public class PhotoDetailUseCaseImpl: PhotoDetailUseCase {
    private let photoRepository: PhotosRepository
    
    public init(photoRepository: PhotosRepository) {
        self.photoRepository = photoRepository
    }
    
    public func execute(photoId: String) async throws -> PhotoEntity {
        try await self.photoRepository.fetchPhotoDetails(id: photoId)
    }
}
