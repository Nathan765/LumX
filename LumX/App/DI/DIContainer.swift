//
//  DIContainer.swift
//  LumX
//
//  Created by Nathan Stéphant on 21/02/2025.
//

import Factory
import DataModule
import NetworkingModule
import ImageGridModule
import ImageDetailModule

extension Container { // WIP rework
    var networkService: Factory<NetworkService> {
        self { URLSessionNetworkServiceImpl() }
            .shared
    }
    
    var unsplashAPIService: Factory<UnsplashAPIServiceImpl> {
        self { UnsplashAPIServiceImpl(networkService: self.networkService()) }
            .shared
    }
    
    var photoDataMapper: Factory<PhotoDataMapper> {
        self { PhotoDataMapperImpl() }
            .shared
    }
    
    var photoRemoteDataSource: Factory<PhotosRemoteDataSource> {
        self { PhotosRemoteDataSourceImpl(
            unsplashAPIService: self.unsplashAPIService(),
            photoDataMapper: self.photoDataMapper()
        
        ) }
            .shared
    }
    
    var photoDomainMapper: Factory<PhotoDomainMapper> {
        self { PhotoDomainMapperImpl() }
            .shared
    }
    
    var photoRepository: Factory<PhotosRepository> {
        self { PhotoRepositoryImpl(
            photoRemoteDataSource: self.photoRemoteDataSource(),
            photoDomainMapper: self.photoDomainMapper()
        ) }
            .shared
    }
    
    var photoListUseCase: Factory<PhotoListUseCase> {
        self { PhotoListUseCaseImpl(photoRepository: self.photoRepository()) }
            .shared
    }
    
    var photoDetailUseCase: Factory<PhotoDetailUseCase> {
        self { PhotoDetailUseCaseImpl(photoRepository: self.photoRepository()) }
            .shared
    }
    
    var photoDownloadUseCase: Factory<PhotoDownloadUseCase> {
        self { PhotoDownloadUseCaseImpl(unsplashAPIService: self.unsplashAPIService()) }
            .shared
    }
    
    var imageCellViewModelProvider: (PhotoUIModel) -> ImageCellViewModel {
        { ImageCellViewModel(
            photo: $0,
            photoDownloadUseCase: self.photoDownloadUseCase()
        ) }
    }
    
    var photoUIMapper: Factory<PhotoUIMapper> {
        self { PhotoUIMapperImpl() }
            .shared
    }
    
    var imageGridViewModel: Factory<ImageGridViewModel> {
        self { ImageGridViewModel(
            photoListUseCase: self.photoListUseCase(),
            photoUIMapper: self.photoUIMapper()
        ) }
    }
}
