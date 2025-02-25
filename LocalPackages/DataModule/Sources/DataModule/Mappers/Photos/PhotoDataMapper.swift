//
//  PhotoDataMapper.swift
//  ImageGridModule
//
//  Created by Nathan Stéphant on 23/02/2025.
//

import NetworkingModule

public protocol PhotoDataMapper {
    func map(from response: PhotoAPIResponse) -> PhotoDataModel
    func map(from responses: [PhotoAPIResponse]) -> [PhotoDataModel]
}
