//
//  UnsplashService.swift
//  LumX
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import Foundation

class UnsplashService {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchPhotos(page: Int = 1, perPage: Int = 10, completion: @escaping (Result<[Photo], NetworkError>) -> Void) {
        let request = UnsplashEndpoint.listPhotos(page: page, perPage: perPage).request
        
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.requestFailed(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let photos = try JSONDecoder().decode([Photo].self, from: data)
                completion(.success(photos))
            } catch {
                completion(.failure(.decodingFailed(error)))
            }
        }.resume()
    }
    
    func fetchPhoto(id: String, completion: @escaping (Result<Photo, NetworkError>) -> Void) {
        let request = UnsplashEndpoint.getPhoto(id: id).request
        
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.requestFailed(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let photo = try JSONDecoder().decode(Photo.self, from: data)
                completion(.success(photo))
            } catch {
                completion(.failure(.decodingFailed(error)))
            }
        }.resume()
    }
}
