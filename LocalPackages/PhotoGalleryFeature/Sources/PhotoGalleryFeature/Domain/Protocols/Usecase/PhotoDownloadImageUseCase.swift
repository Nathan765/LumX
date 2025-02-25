//
//  PhotoDownloadImageUseCase.swift
//  PhotoGalleryFeature
//
//  Created by Nathan Stéphant on 23/02/2025.
//

import Foundation

public protocol PhotoDownloadImageUseCase {
    func execute(imageURL: String) async throws -> Data
}
