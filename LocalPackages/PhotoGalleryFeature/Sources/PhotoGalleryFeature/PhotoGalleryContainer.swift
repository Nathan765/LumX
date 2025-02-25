//
//  PhotoGalleryContainer.swift
//  PhotoGalleryFeature
//
//  Created by Nathan Stéphant on 25/02/2025.
//

import Factory

extension Container {
    var photoListUseCase: Factory<PhotoListUseCase> {
        self { PhotoListUseCaseImpl(photoRepository: self.photoRepository()) }
            .shared
    }

    var photoDownloadUseCase: Factory<PhotoDownloadImageUseCase> {
        self { PhotoDownloadImageUseCaseImpl(unsplashAPIService: self.unsplashAPIService()) }
            .shared
    }

    var photoUIMapper: Factory<PhotoUIMapper> {
        self { PhotoUIMapperImpl() }
            .shared
    }

    public var imageGridViewModel: Factory<PhotoGalleryViewModel> {
        self { PhotoGalleryViewModel(
            photoListUseCase: self.photoListUseCase(),
            photoUIMapper: self.photoUIMapper()
        ) }
    }
    
    
    public var imageCellViewModelProvider: (PhotoUIModel) -> PhotoGalleryCellViewModel {
        { PhotoGalleryCellViewModel(
            photo: $0,
            photoDownloadUseCase: self.photoDownloadUseCase()
        ) }
    }
}
