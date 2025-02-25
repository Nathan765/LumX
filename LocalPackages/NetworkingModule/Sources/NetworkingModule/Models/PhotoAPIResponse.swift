//
//  PhotoAPIResponse.swift
//  NetworkingModule
//
//  Created by Nathan Stéphant on 19/02/2025.
//

public struct PhotoAPIResponse: Decodable, Hashable {
    public let id: String
    public let width: Int
    public let height: Int
    public let description: String?
    public let urls: PhotoURLsAPIResponse
    public let user: UserAPIResponse
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: PhotoAPIResponse, rhs: PhotoAPIResponse) -> Bool {
        return lhs.id == rhs.id
    }
}
