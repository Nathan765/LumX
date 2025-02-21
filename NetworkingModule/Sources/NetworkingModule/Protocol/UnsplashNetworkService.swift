//
//  UnsplashNetworkService.swift
//  NetworkingModule
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import Foundation

public protocol UnsplashNetworkService {
    func fetchPhotos(page: Int, perPage: Int) async throws -> [Photo]
    func fetchPhoto(id: String) async throws -> Photo
    func download(imageURL: String) async throws -> Data
}
