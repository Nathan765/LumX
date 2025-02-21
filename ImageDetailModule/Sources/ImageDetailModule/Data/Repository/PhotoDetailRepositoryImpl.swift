//
//  PhotoDetailRepositoryImpl.swift
//  ImageDetailModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

public class PhotoDetailRepositoryImpl: PhotoDetailRepository {
    private let remoteDataSource: PhotoDetailRemoteDataSource
    
    public init(
        photoDetailRemoteDataSource: PhotoDetailRemoteDataSource
    ) {
        self.remoteDataSource = photoDetailRemoteDataSource
    }
    
    public func fetchPhotoDetail(photoId: String) async throws -> PhotoEntity {
        let photoDataModel = try await remoteDataSource.fetchPhotoDetail(photoId: photoId)
        return PhotoEntity(dataModel: photoDataModel)
    }
}
