//
//  Photo.swift
//  NetworkingModule
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import Foundation

public struct Photo: Decodable, Hashable {
    public let id: String
    public let width: Int
    public let height: Int
    public let description: String?
    public let urls: PhotoURLs
    public let user: User
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.id == rhs.id
    }
}
