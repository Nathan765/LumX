//
//  PhotoDomainMapperImpl.swift
//  ImageGridModule
//
//  Created by Nathan Stéphant on 23/02/2025.
//

import Entities

public class PhotoDomainMapperImpl: PhotoDomainMapper{
    public init() {}

    public func map(from dataModel: PhotoDataModel) -> PhotoEntity {
        return PhotoEntity(
            id: dataModel.id,
            width: dataModel.width,
            height: dataModel.height,
            description: dataModel.description,
            urls: PhotoURLsEntity(
                raw: dataModel.urls.raw,
                full: dataModel.urls.full,
                regular: dataModel.urls.regular,
                small: dataModel.urls.small,
                thumb: dataModel.urls.thumb
            ),
            user: UserEntity(
                name: dataModel.user.name
            )
        )
    }

    public func map(from dataModels: [PhotoDataModel]) -> [PhotoEntity] {
        return dataModels.map { map(from: $0) }
    }
}
