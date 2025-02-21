//
//  PhotoRemoteDataSourceImpl.swift
//  ImageGridModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

import NetworkingModule

public class PhotoRemoteDataSourceImpl: PhotoRemoteDataSource {
    private let unsplashNetworkService: UnsplashNetworkService
    
    public init(
        unsplashNetworkService: UnsplashNetworkService
    ) {
        self.unsplashNetworkService = unsplashNetworkService
    }
    
    public func fetchPhotoList(page: Int, perPage: Int) async throws -> [PhotoDataModel] {
        try await unsplashNetworkService.fetchPhotos(page: page, perPage: perPage).map { PhotoDataModel(from: $0) }
    }
}
