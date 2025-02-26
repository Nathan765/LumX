//
//  PhotoDataModel.swift
//  ImageGridModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

public struct PhotoDataModel: Hashable {
    public let id: String
    public let width: Int
    public let height: Int
    public let description: String?
    public let urls: PhotoURLsDataModel
    public let user: UserDataModel
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: PhotoDataModel, rhs: PhotoDataModel) -> Bool {
        return lhs.id == rhs.id
    }
}
