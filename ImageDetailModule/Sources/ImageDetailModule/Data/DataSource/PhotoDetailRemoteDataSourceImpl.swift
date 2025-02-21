//
//  PhotoDetailRemoteDataSourceImpl.swift
//  ImageDetailModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

import NetworkingModule

public class PhotoDetailRemoteDataSourceImpl: PhotoDetailRemoteDataSource {
    private let unsplashNetworkService: UnsplashNetworkService
    
    public init(
        unsplashNetworkService: UnsplashNetworkService
    ) {
        self.unsplashNetworkService = unsplashNetworkService
    }
    
    public  func fetchPhotoDetail(photoId: String) async throws -> PhotoDataModel {
        let photo = try await unsplashNetworkService.fetchPhoto(id: photoId)
        return PhotoDataModel(from: photo)
    }
}
