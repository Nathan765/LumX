//
//  PhotoRepositoryImpl.swift
//  ImageGridModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

import Entities

public class PhotoRepositoryImpl: PhotosRepository {
    private let remoteDataSource: PhotosRemoteDataSource
    private let photoDomainMapper: PhotoDomainMapper
    
    public init(
        photoRemoteDataSource: PhotosRemoteDataSource,
        photoDomainMapper: PhotoDomainMapper
    ) {
        self.remoteDataSource = photoRemoteDataSource
        self.photoDomainMapper = photoDomainMapper
    }
    
    public func fetchPhotoDetails(id: String) async throws -> PhotoEntity {
        let dataModel = try await remoteDataSource.fetchPhotoDetails(id: id)
        return photoDomainMapper.map(from: dataModel)
    }
    
    public func fetchPhotoList(page: Int, perPage: Int) async throws -> [PhotoEntity] {
        let dataModels = try await remoteDataSource.fetchPhotoList(page: page, perPage: perPage)
        return photoDomainMapper.map(from: dataModels)
    }
}
