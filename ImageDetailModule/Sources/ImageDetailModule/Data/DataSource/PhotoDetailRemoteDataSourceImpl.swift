//
//  PhotoDetailRemoteDataSourceImpl.swift
//  ImageDetailModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

import NetworkingModule

public class PhotoDetailRemoteDataSourceImpl: PhotoDetailRemoteDataSource {
    private let unsplashAPIService: UnsplashAPIService
    
    public init(
        unsplashAPIService: UnsplashAPIService
    ) {
        self.unsplashAPIService = unsplashAPIService
    }
    
    public  func fetchPhotoDetail(photoId: String) async throws -> PhotoDataModel {
        let photo = try await unsplashAPIService.fetchPhoto(id: photoId)
        return PhotoDataModel(from: photo)
    }
}
