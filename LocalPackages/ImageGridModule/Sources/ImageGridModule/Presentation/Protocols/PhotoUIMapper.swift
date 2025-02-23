//
//  PhotoUIMapper.swift
//  ImageGridModule
//
//  Created by Nathan Stéphant on 23/02/2025.
//

import Entities

public protocol PhotoUIMapper {
    func map(from entity: PhotoEntity) -> PhotoUIModel
    func map(from entities: [PhotoEntity]) -> [PhotoUIModel]
}
