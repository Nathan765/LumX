//
//  DIContainer.swift
//  LumX
//
//  Created by Nathan Stéphant on 21/02/2025.
//

import Factory
import NetworkingModule
import ImageGridModule

extension Container {
    var unsplashNetworkService: Factory<UnsplashNetworkService> {
        self { UnsplashNetworkServiceImpl() }
            .shared
    }
    
    var photoRemoteDataSource: Factory<PhotoRemoteDataSource> {
        self { PhotoRemoteDataSourceImpl(unsplashNetworkService: self.unsplashNetworkService()) }
            .shared
    }
    
    var photoRepository: Factory<PhotoRepository> {
        self { PhotoRepositoryImpl(photoRemoteDataSource: self.photoRemoteDataSource()) }
            .shared
    }
    
    var photoListUseCase: Factory<PhotoListUseCase> {
        self { PhotoListUseCaseImpl(photoRepository: self.photoRepository()) }
            .shared
    }
    
    var imageGridViewModel: Factory<ImageGridViewModel> {
        self { ImageGridViewModel(photoListUseCase: self.photoListUseCase()) }
    }
}
