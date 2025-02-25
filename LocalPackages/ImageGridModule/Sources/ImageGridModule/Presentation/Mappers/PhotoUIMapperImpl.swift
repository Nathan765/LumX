//
//  PhotoUIMapperImpl.swift
//  ImageGridModule
//
//  Created by Nathan Stéphant on 23/02/2025.
//

import Entities

public class PhotoUIMapperImpl: PhotoUIMapper {
    public init() {}

    public func map(from entity: PhotoEntity) -> PhotoUIModel {
        return PhotoUIModel(
            id: entity.id,
            width: entity.width,
            height: entity.height,
            description: entity.description,
            urls: PhotoURLsUIModel(
                raw: entity.urls.raw,
                full: entity.urls.full,
                regular: entity.urls.regular,
                small: entity.urls.small,
                thumb: entity.urls.thumb
            ),
            user: UserUIModel(name: entity.user.name)
        )
    }

    public func map(from entities: [PhotoEntity]) -> [PhotoUIModel] {
        return entities.map { map(from: $0) }
    }
}
