//
//  UnsplashNetworkServiceImpl.swift
//  NetworkingModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

import Foundation

public class UnsplashNetworkServiceImpl: UnsplashNetworkService {
    private let networkService: NetworkService
    
    public init(networkService: NetworkService = URLSessionNetworkServiceImpl()) {
        self.networkService = networkService
    }
}

extension UnsplashNetworkServiceImpl {
    public func fetchPhotos(page: Int, perPage: Int) async throws -> [Photo] {
        return try await networkService.request(
            on: UnsplashAPI.listPhotos(page: page, perPage: perPage)
        )
    }
}

extension UnsplashNetworkServiceImpl {
    public func fetchPhoto(id: String) async throws -> Photo {
        return try await networkService.request(
            on: UnsplashAPI.getPhoto(id: id)
        )
    }
}

extension UnsplashNetworkServiceImpl {
    private static let imageCache = NSCache<NSString, NSData>()
    
    public func download(imageURL: String) async throws -> Data {
        guard let url = URL(string: imageURL) else {
            throw URLError(.badURL)
        }
        
        let cacheKey = NSString(string: imageURL)
        
        if let cachedData = UnsplashNetworkServiceImpl.imageCache.object(forKey: cacheKey) {
            return cachedData as Data
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        UnsplashNetworkServiceImpl.imageCache.setObject(data as NSData, forKey: cacheKey)
        
        return data
    }
}
