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
    
    public init(
        id: String,
        width: Int,
        height: Int,
        description: String?,
        urls: PhotoURLsEntity,
        user: UserEntity
    ) {
        self.id = id
        self.width = width
        self.height = height
        self.description = description
        self.urls = urls
        self.user = user
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: PhotoEntity, rhs: PhotoEntity) -> Bool {
        return lhs.id == rhs.id
    }
}
