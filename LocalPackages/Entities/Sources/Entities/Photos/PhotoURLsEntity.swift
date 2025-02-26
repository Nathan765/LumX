//
//  PhotoURLsEntity.swift
//  Entities
//
//  Created by Nathan Stéphant on 23/02/2025.
//

public struct PhotoURLsEntity {
    public let raw: String
    public let full: String
    public let regular: String
    public let small: String
    public let thumb: String
    
    public init(
        raw: String,
        full: String,
        regular: String,
        small: String,
        thumb: String
    ) {
        self.raw = raw
        self.full = full
        self.regular = regular
        self.small = small
        self.thumb = thumb
    }
}
