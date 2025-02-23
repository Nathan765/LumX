//
//  UnsplashAPIService.swift
//  NetworkingModule
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import Foundation

public protocol UnsplashAPIService {
    func fetchPhotos(page: Int, perPage: Int) async throws -> [PhotoAPIResponse]
    func fetchPhoto(id: String) async throws -> PhotoAPIResponse
    func download(imageURL: String) async throws -> Data
}
