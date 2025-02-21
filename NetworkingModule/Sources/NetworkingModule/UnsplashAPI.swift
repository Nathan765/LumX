//
//  UnsplashAPI.swift
//  LumX
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import Foundation
import Moya

enum UnsplashAPI {
    case listPhotos(page: Int, perPage: Int)
    case getPhoto(id: String)
}

extension UnsplashAPI: TargetType {
    var baseURL: URL {
        URL(string: "https://api.unsplash.com")!
    }
    
    var path: String {
        switch self {
        case .listPhotos:
            "/photos"
        case .getPhoto(let id):
            "/photos/\(id)"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Task {
        switch self {
        case .listPhotos(let page, let perPage):
            return .requestParameters(parameters: ["page": page, "per_page": perPage], encoding: URLEncoding.queryString)
        case .getPhoto:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        ["Authorization": "Client-ID xz5MUitr6CDevL5gRiAEXSHVeD14I4XYpSLvv6zTd2s"]
    }
    
    var sampleData: Data {
        return Data()
    }
}
