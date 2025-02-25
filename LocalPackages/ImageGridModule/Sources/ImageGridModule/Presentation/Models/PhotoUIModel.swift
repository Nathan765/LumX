//
//  PhotoUIModel.swift
//  ImageGridModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

import Foundation
import Entities

public struct PhotoUIModel: Hashable {
    public let id: String
    public let width: Int
    public let height: Int
    public let description: String?
    public let urls: PhotoURLsUIModel
    public let user: UserUIModel
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: PhotoUIModel, rhs: PhotoUIModel) -> Bool {
        return lhs.id == rhs.id
    }
}
