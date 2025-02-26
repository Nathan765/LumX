//
//  PhotoDomainMapper.swift
//  ImageGridModule
//
//  Created by Nathan Stéphant on 23/02/2025.
//

import Entities

public protocol PhotoDomainMapper {
    func map(from dataModel: PhotoDataModel) -> PhotoEntity
    func map(from dataModels: [PhotoDataModel]) -> [PhotoEntity]
}
