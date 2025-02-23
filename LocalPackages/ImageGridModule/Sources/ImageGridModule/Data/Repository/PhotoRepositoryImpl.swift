//
//  PhotoRepositoryImpl.swift
//  ImageGridModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

import Entities

public class PhotoRepositoryImpl: PhotoRepository {    
    private let remoteDataSource: PhotoRemoteDataSource
    private let photoDomainMapper: PhotoDomainMapper
    
    public init(
        photoRemoteDataSource: PhotoRemoteDataSource,
        photoDomainMapper: PhotoDomainMapper
    ) {
        self.remoteDataSource = photoRemoteDataSource
        self.photoDomainMapper = photoDomainMapper
    }
    
    public func fetchPhotoList(page: Int, perPage: Int) async throws -> [PhotoEntity] {
        let dataModels = try await remoteDataSource.fetchPhotoList(page: page, perPage: perPage)
        return photoDomainMapper.map(from: dataModels)
    }
}
