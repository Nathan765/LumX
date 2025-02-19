//
//  UnsplashEndpoint.swift
//  LumX
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import Foundation

enum UnsplashEndpoint {
    case listPhotos(page: Int, perPage: Int)
    case getPhoto(id: String)
    
    var url: URL {
        switch self {
        case .listPhotos(let page, let perPage):
            return URL(string: "https://api.unsplash.com/photos?page=\(page)&per_page=\(perPage)")!
        case .getPhoto(let id):
            return URL(string: "https://api.unsplash.com/photos/\(id)")!
        }
    }
    
    var request: URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Client-ID xz5MUitr6CDevL5gRiAEXSHVeD14I4XYpSLvv6zTd2s", forHTTPHeaderField: "Authorization")
        return request
    }
}
