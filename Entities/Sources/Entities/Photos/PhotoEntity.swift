//
//  PhotoEntity.swift
//  Entities
//
//  Created by Nathan Stéphant on 23/02/2025.
//

public struct PhotoEntity: Hashable {
    public let id: String
    public let width: Int
    public let height: Int
    public let description: String?
    public let urls: PhotoURLsEntity
    public let user: UserEntity
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: PhotoEntity, rhs: PhotoEntity) -> Bool {
        return lhs.id == rhs.id
    }
}
