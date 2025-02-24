//
//  PhotoListUseCaseImpl.swift
//  ImageGridModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

import Entities
import DataModule

public class PhotoListUseCaseImpl: PhotoListUseCase {
    private let photoRepository: PhotoRepository
    
    public init(photoRepository: PhotoRepository) {
        self.photoRepository = photoRepository
    }
    
    public func execute(page: Int, perPage: Int) async throws -> [PhotoEntity] {
        try await self.photoRepository.fetchPhotoList(page: page, perPage: perPage)
    }
}
