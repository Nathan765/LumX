//
//  PhotoDetailRepository.swift
//  ImageDetailModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

import Entities

public protocol PhotoDetailRepository {
    func fetchPhotoDetail(photoId: String) async throws -> PhotoEntity
}
