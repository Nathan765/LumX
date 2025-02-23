//
//  PhotoDataModel.swift
//  ImageDetailModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

import NetworkingModule

public struct PhotoDataModel: Hashable {
    public let id: String
    public let width: Int
    public let height: Int
    public let description: String?
    public let urls: PhotoURLsDataModel
    public let user: UserDataModel
    
    public init(from photo: PhotoAPIResponse) {
        self.id = photo.id
        self.width = photo.width
        self.height = photo.height
        self.description = photo.description
        self.urls = PhotoURLsDataModel(from: photo.urls)
        self.user = UserDataModel(from: photo.user)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: PhotoDataModel, rhs: PhotoDataModel) -> Bool {
        return lhs.id == rhs.id
    }
}

public struct PhotoURLsDataModel: Decodable {
    public let raw: String
    public let full: String
    public let regular: String
    public let small: String
    public let thumb: String
    
    public init(from urls: PhotoURLsAPIResponse) {
        self.raw = urls.raw
        self.full = urls.full
        self.regular = urls.regular
        self.small = urls.small
        self.thumb = urls.thumb
    }
}

public struct UserDataModel: Decodable {
    public let name: String?
    
    public init(from user: UserAPIResponse) {
        self.name = user.name
    }
}
