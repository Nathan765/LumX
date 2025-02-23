//
//  PhotoDownloadUseCase.swift
//  ImageGridModule
//
//  Created by Nathan Stéphant on 23/02/2025.
//

import Foundation

public protocol PhotoDownloadUseCase {
    func execute(imageURL: String) async throws -> Data
}
