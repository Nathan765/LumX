//
//  Photo.swift
//  LumX
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import Foundation

struct Photo: Codable {
    let id: String
    let width: Int
    let height: Int
    let description: String?
    let urls: PhotoURLs
}

struct PhotoURLs: Codable {
    let raw: String
    let full: String
    let regular: String
    let small: String
    let thumb: String
}
