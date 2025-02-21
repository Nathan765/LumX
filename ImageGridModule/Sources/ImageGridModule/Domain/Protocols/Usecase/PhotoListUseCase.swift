//
//  PhotoListUseCase.swift
//  ImageGridModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

public protocol PhotoListUseCase {
    func execute(page: Int, perPage: Int) async throws -> [PhotoEntity]
}
