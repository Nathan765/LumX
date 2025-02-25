//
//  PhotoListUseCase.swift
//  PhotoGalleryFeature
//
//  Created by Nathan Stéphant on 21/02/2025.
//

import Entities

public protocol PhotoListUseCase {
    func execute(page: Int, perPage: Int) async throws -> [PhotoEntity]
}
