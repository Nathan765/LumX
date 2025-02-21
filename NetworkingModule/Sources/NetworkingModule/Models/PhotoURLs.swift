//
//  PhotoURLs.swift
//  NetworkingModule
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import Foundation

public struct PhotoURLs: Decodable {
    public let raw: String
    public let full: String
    public let regular: String
    public let small: String
    public let thumb: String
}
