//
//  PhotoRepository.swift
//  ImageGridModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

public protocol PhotoRepository {
    func fetchPhotoList(page: Int, perPage: Int) async throws -> [PhotoEntity]
}
