//
//  UnsplashAPIServiceImpl.swift
//  NetworkingModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

import Foundation

public class UnsplashAPIServiceImpl: UnsplashAPIService {
    private let networkService: NetworkService
    
    public init(networkService: NetworkService) {
        self.networkService = networkService
    }
}

extension UnsplashAPIServiceImpl {
    public func fetchPhotos(
        page: Int,
        perPage: Int
    ) async throws -> [PhotoAPIResponse] {
        try await networkService.request(
            on: UnsplashAPI.listPhotos(page: page, perPage: perPage)
        )
    }
}

extension UnsplashAPIServiceImpl {
    public func fetchPhoto(id: String) async throws -> PhotoAPIResponse {
        try await networkService.request(
            on: UnsplashAPI.getPhoto(id: id)
        )
    }
}

extension UnsplashAPIServiceImpl {
    private static let imageCache = NSCache<NSString, NSData>()
    
    public func download(imageURL: String) async throws -> Data {
        guard let url = URL(string: imageURL) else {
            throw URLError(.badURL)
        }
        
        let cacheKey = NSString(string: imageURL)
        
        if let cachedData = UnsplashAPIServiceImpl.imageCache.object(forKey: cacheKey) {
            return cachedData as Data
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        UnsplashAPIServiceImpl.imageCache.setObject(data as NSData, forKey: cacheKey)
        
        return data
    }
}
