//
//  PhotosRemoteDataSource.swift
//  ImageGridModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

public protocol PhotosRemoteDataSource {
    func fetchPhotoDetails(id: String) async throws -> PhotoDataModel
    func fetchPhotoList(page: Int, perPage: Int) async throws -> [PhotoDataModel]
}
