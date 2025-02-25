//
//  ImageGridContainer.swift
//  ImageGridModule
//
//  Created by Nathan Stéphant on 25/02/2025.
//

import Factory

extension Container {
    var photoListUseCase: Factory<PhotoListUseCase> {
        self { PhotoListUseCaseImpl(photoRepository: self.photoRepository()) }
            .shared
    }

    var photoDownloadUseCase: Factory<PhotoDownloadUseCase> {
        self { PhotoDownloadUseCaseImpl(unsplashAPIService: self.unsplashAPIService()) }
            .shared
    }

    var photoUIMapper: Factory<PhotoUIMapper> {
        self { PhotoUIMapperImpl() }
            .shared
    }

    public var imageGridViewModel: Factory<ImageGridViewModel> {
        self { ImageGridViewModel(
            photoListUseCase: self.photoListUseCase(),
            photoUIMapper: self.photoUIMapper()
        ) }
    }
    
    
    public var imageCellViewModelProvider: (PhotoUIModel) -> ImageCellViewModel {
        { ImageCellViewModel(
            photo: $0,
            photoDownloadUseCase: self.photoDownloadUseCase()
        ) }
    }
}
