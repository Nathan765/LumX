//
//  PhotoRepositoryImpl.swift
//  ImageGridModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

//import Entities

public class PhotoRepositoryImpl: PhotoRepository {
    private let remoteDataSource: PhotoRemoteDataSource
    
    public init(
        photoRemoteDataSource: PhotoRemoteDataSource
    ) {
        self.remoteDataSource = photoRemoteDataSource
    }
    
    public func fetchPhotoList(page: Int, perPage: Int) async throws -> [PhotoEntity] {
        try await remoteDataSource.fetchPhotoList(page: page, perPage: perPage).map { PhotoEntity(dataModel: $0) }
    }
}
