////
////  PhotoEntity.swift
////  ImageDetailModule
////
////  Created by Nathan Stéphant on 21/02/2025.
////
//
//public struct PhotoEntity: Hashable {
//    public let id: String
//    public let width: Int
//    public let height: Int
//    public let description: String?
//    public let urls: PhotoURLsEntity
//    public let user: UserEntity
//    
//    public init(dataModel: PhotoDataModel) {
//        self.id = dataModel.id
//        self.width = dataModel.width
//        self.height = dataModel.height
//        self.description = dataModel.description
//        self.urls = PhotoURLsEntity(dataModel: dataModel.urls)
//        self.user = UserEntity(dataModel: dataModel.user)
//    }
//    
//    public func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
//    
//    public static func == (lhs: PhotoEntity, rhs: PhotoEntity) -> Bool {
//        return lhs.id == rhs.id
//    }
//}
//
//public struct PhotoURLsEntity: Decodable {
//    public let raw: String
//    public let full: String
//    public let regular: String
//    public let small: String
//    public let thumb: String
//    
//    public init(dataModel: PhotoURLsDataModel) {
//        self.raw = dataModel.raw
//        self.full = dataModel.full
//        self.regular = dataModel.regular
//        self.small = dataModel.small
//        self.thumb = dataModel.thumb
//    }
//}
//
//public struct UserEntity: Decodable {
//    public let name: String?
//    
//    public init(dataModel: UserDataModel) {
//        self.name = dataModel.name
//    }
//}
