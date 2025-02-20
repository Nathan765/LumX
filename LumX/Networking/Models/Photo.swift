//
//  Photo.swift
//  LumX
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import Foundation

struct Photo: Codable, Hashable {
    let id: String
    let width: Int
    let height: Int
    let description: String?
    let urls: PhotoURLs
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.id == rhs.id
    }
}
