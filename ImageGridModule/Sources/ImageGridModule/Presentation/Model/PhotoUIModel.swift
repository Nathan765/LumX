//
//  PhotoUIModel.swift
//  ImageGridModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

import Foundation

public struct PhotoUIModel: Hashable {
    public let id: String
    public let width: Int
    public let height: Int
    public let description: String?
    public let urls: PhotoURLsUIModel
    public let user: UserUIModel
    
    public init(entity: PhotoEntity) {
        self.id = entity.id
        self.width = entity.width
        self.height = entity.height
        self.description = entity.description
        self.urls = PhotoURLsUIModel(entity: entity.urls)
        self.user = UserUIModel(entity: entity.user)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: PhotoUIModel, rhs: PhotoUIModel) -> Bool {
        return lhs.id == rhs.id
    }
}

public struct PhotoURLsUIModel {
    public let raw: String
    public let full: String
    public let regular: String
    public let small: String
    public let thumb: String
    
    public init(entity: PhotoURLsEntity) {
        self.raw = entity.raw
        self.full = entity.full
        self.regular = entity.regular
        self.small = entity.small
        self.thumb = entity.thumb
    }
}

public struct UserUIModel {
    public let name: String?
    
    public init(entity: UserEntity) {
        self.name = entity.name
    }
}
