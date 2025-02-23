//
//  PhotoURLsEntity.swift
//  Entities
//
//  Created by Nathan Stéphant on 23/02/2025.
//

public struct PhotoURLsEntity: Decodable {
    public let raw: String
    public let full: String
    public let regular: String
    public let small: String
    public let thumb: String
}
