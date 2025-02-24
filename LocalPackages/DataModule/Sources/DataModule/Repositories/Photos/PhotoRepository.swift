//
//  PhotoRepository.swift
//  ImageGridModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

import Entities

public protocol PhotoRepository {
    func fetchPhotoDetail(photoId: String) async throws -> PhotoEntity
    func fetchPhotoList(page: Int, perPage: Int) async throws -> [PhotoEntity]
}
