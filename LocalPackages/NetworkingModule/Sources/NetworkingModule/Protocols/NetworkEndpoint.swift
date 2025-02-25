//
//  NetworkEndpoint.swift
//  NetworkingModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

import Foundation

public typealias HTTPHeaders = [String : String]

public protocol NetworkEndpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var sampleData: Data { get }
    var parameters: [String: Any]? { get }
    var headers: HTTPHeaders? { get }
}

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}
