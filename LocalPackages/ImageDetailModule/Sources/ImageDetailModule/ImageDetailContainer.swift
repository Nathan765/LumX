//
//  ImageDetailContainer.swift
//  ImageDetailModule
//
//  Created by Nathan Stéphant on 25/02/2025.
//

import Factory

extension Container {
    var photoDetailUseCase: Factory<PhotoDetailUseCase> {
        self { PhotoDetailUseCaseImpl(photoRepository: Container.shared.photoRepository()) }
            .shared
    }
    
    public var imageDetailViewModel: ParameterFactory<String, ImageDetailViewModel> {
        self { photoId in
            ImageDetailViewModel(photoDetailUseCase: self.photoDetailUseCase(), photoId: photoId)
        }
    }
}
