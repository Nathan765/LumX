//
//  PhotoDetailsUseCase.swift
//  PhotoDetailsFeature
//
//  Created by Nathan Stéphant on 21/02/2025.
//

import Entities

public protocol PhotoDetailsUseCase {
    func execute(photoId: String) async throws -> PhotoEntity
}
