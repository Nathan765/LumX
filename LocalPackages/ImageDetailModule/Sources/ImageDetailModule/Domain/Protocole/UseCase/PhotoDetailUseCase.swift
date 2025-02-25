//
//  PhotoDetailUseCase.swift
//  ImageDetailModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

import Entities

public protocol PhotoDetailUseCase {
    func execute(photoId: String) async throws -> PhotoEntity
}
