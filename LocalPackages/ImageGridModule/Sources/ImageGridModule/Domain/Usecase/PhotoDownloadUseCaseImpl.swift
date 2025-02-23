//
//  PhotoDownloadUseCaseImpl.swift
//  ImageGridModule
//
//  Created by Nathan Stéphant on 23/02/2025.
//

import Foundation
import NetworkingModule

public class PhotoDownloadUseCaseImpl: PhotoDownloadUseCase {
    private let unsplashAPIService: UnsplashAPIService
    
    public init(unsplashAPIService: UnsplashAPIService) {
        self.unsplashAPIService = unsplashAPIService
    }
    
    public func execute(imageURL: String) async throws -> Data {
        return try await unsplashAPIService.download(imageURL: imageURL)
    }
}
