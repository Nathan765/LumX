//
//  PhotoDataMapperImpl.swift
//  ImageGridModule
//
//  Created by Nathan Stéphant on 23/02/2025.
//

import NetworkingModule

public class PhotoDataMapperImpl: PhotoDataMapper {
    public init() {}

    public func map(from response: PhotoAPIResponse) -> PhotoDataModel {
        return PhotoDataModel(
            id: response.id,
            width: response.width,
            height: response.height,
            description: response.description,
            urls: PhotoURLsDataModel(
                raw: response.urls.raw,
                full: response.urls.full,
                regular: response.urls.regular,
                small: response.urls.small,
                thumb: response.urls.thumb
            ),
            user: UserDataModel(
                name: response.user.name
            )
        )
    }

    public func map(from responses: [PhotoAPIResponse]) -> [PhotoDataModel] {
        return responses.map { map(from: $0) }
    }
}
