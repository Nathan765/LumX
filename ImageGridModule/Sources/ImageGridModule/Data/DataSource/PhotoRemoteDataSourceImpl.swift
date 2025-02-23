//
//  PhotoRemoteDataSourceImpl.swift
//  ImageGridModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

import NetworkingModule

public class PhotoRemoteDataSourceImpl: PhotoRemoteDataSource {
    private let unsplashAPIService: UnsplashAPIService
    
    public init(
        unsplashAPIService: UnsplashAPIService
    ) {
        self.unsplashAPIService = unsplashAPIService
    }
    
    public func fetchPhotoList(page: Int, perPage: Int) async throws -> [PhotoDataModel] {
        try await unsplashAPIService.fetchPhotos(page: page, perPage: perPage).map { PhotoDataModel(from: $0) }
    }
}
