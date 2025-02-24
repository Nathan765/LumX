//
//  UnsplashAPI.swift
//  NetworkingModule
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import Foundation

enum UnsplashAPI {
    case listPhotos(page: Int, perPage: Int)
    case getPhoto(id: String)
}

extension UnsplashAPI: NetworkEndpoint {
    var baseURL: URL {
        return URL(string: "https://api.unsplash.com")!
    }
    
    var path: String {
        switch self {
        case .listPhotos:
            return "/photos"
        case .getPhoto(let id):
            return "/photos/\(id)"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .listPhotos(let page, let perPage):
            return ["page": page, "per_page": perPage]
        case .getPhoto:
            return nil
        }
    }
    
    var headers: HTTPHeaders? {
        // return ["Authorization": "Client-ID xz5MUitr6CDevL5gRiAEXSHVeD14I4XYpSLvv6zTd2s"] // Access Key #1
        return ["Authorization": "Client-ID tuLnfcnb0S82c-Aii9NySmfiRq7_WGozTvA_s6CpcJ4"] // Access Key #2
    }
}
