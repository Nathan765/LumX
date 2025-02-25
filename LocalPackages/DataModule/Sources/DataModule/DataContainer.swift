//
//  DataContainer.swift
//  DataModule
//
//  Created by Nathan Stéphant on 25/02/2025.
//

import Factory

extension Container {
    var photoDataMapper: Factory<PhotoDataMapper> {
        self { PhotoDataMapperImpl() }
            .shared
    }

    var photoDomainMapper: Factory<PhotoDomainMapper> {
        self { PhotoDomainMapperImpl() }
            .shared
    }

    var photoRemoteDataSource: Factory<PhotosRemoteDataSource> {
        self { PhotosRemoteDataSourceImpl(
            unsplashAPIService: Container.shared.unsplashAPIService(),
            photoDataMapper: self.photoDataMapper()
        ) }
        .shared
    }
    
    public var photoRepository: Factory<PhotosRepository> {
        self { PhotoRepositoryImpl(
            photoRemoteDataSource: self.photoRemoteDataSource(),
            photoDomainMapper: self.photoDomainMapper()
        ) }
        .shared
    }
}
