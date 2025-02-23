//
//  PhotoDetailUseCaseImpl.swift
//  ImageDetailModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

public class PhotoDetailUseCaseImpl: PhotoDetailUseCase {
    private let photoDetailRepository: PhotoDetailRepository
    
    public init(
        photoDetailRepository: PhotoDetailRepository)
    {
        self.photoDetailRepository = photoDetailRepository
    }
    
    public func execute(photoId: String) async throws -> PhotoEntity {
        try await self.photoDetailRepository.fetchPhotoDetail(photoId: photoId)
    }
}
