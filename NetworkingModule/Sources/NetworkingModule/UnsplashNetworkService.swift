//
//  UnsplashNetworkService.swift
//  LumX
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import Foundation

public protocol UnsplashNetworkService {
    func fetchPhotos(page: Int, perPage: Int) async throws -> [Photo]
    func fetchPhoto(id: String) async throws -> Photo
    
    func fetchPhotos(page: Int, perPage: Int, completion: @escaping (Result<[Photo], NetworkError>) -> Void)
    func fetchPhoto(id: String, completion: @escaping (Result<Photo, NetworkError>) -> Void)
}

public class UnsplashNetworkServiceImpl: UnsplashNetworkService {
    private let networkService: NetworkService
    
    public init(networkService: NetworkService = MoyaNetworkServiceImpl()) {
        self.networkService = networkService
    }

    public func fetchPhotos(page: Int, perPage: Int) async throws -> [Photo] {
        return try await networkService.request(
            on: UnsplashAPI.listPhotos(page: page, perPage: perPage)
        )
    }
    
    public func fetchPhoto(id: String) async throws -> Photo {
        return try await networkService.request(
            on: UnsplashAPI.getPhoto(id: id)
        )
    }
    
    public func fetchPhotos(page: Int, perPage: Int, completion: @escaping (Result<[Photo], NetworkError>) -> Void) {
        Task {
            do {
                let photos: [Photo] = try await networkService.request(
                    on: UnsplashAPI.listPhotos(page: page, perPage: perPage)
                )
                completion(.success(photos))
            } catch let error as NetworkError {
                completion(.failure(error))
            } catch {
                completion(.failure(.noData))
            }
        }
    }
    
    public func fetchPhoto(id: String, completion: @escaping (Result<Photo, NetworkError>) -> Void) {
        Task {
            do {
                let photo: Photo = try await networkService.request(
                    on: UnsplashAPI.getPhoto(id: id)
                )
                completion(.success(photo))
            } catch let error as NetworkError {
                completion(.failure(error))
            } catch {
                completion(.failure(.noData))
            }
        }
    }
}
