//
//  PhotosRemoteDataSourceImpl.swift
//  ImageGridModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

import NetworkingModule

public class PhotosRemoteDataSourceImpl: PhotosRemoteDataSource {    
    private let unsplashAPIService: UnsplashAPIService
    private let photoDataMapper: PhotoDataMapper
    
    public init(
        unsplashAPIService: UnsplashAPIService,
        photoDataMapper: PhotoDataMapper
    ) {
        self.unsplashAPIService = unsplashAPIService
        self.photoDataMapper = photoDataMapper
    }
    
    public func fetchPhotoDetails(id: String) async throws -> PhotoDataModel {
        let response = try await unsplashAPIService.fetchPhoto(id: id)
        return photoDataMapper.map(from: response)
    }
    
    public func fetchPhotoList(page: Int, perPage: Int) async throws -> [PhotoDataModel] {
        let responses = try await unsplashAPIService.fetchPhotos(page: page, perPage: perPage)
        return photoDataMapper.map(from: responses)
    }
}
