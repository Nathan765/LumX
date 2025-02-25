//
//  PhotoDetailsContainer.swift
//  PhotoDetailsFeature
//
//  Created by Nathan Stéphant on 25/02/2025.
//

import Factory

extension Container {
    var photoDetailsUseCase: Factory<PhotoDetailsUseCase> {
        self { PhotoDetailsUseCaseImpl(photoRepository: Container.shared.photoRepository()) }
            .shared
    }
    
    public var photoDetailsViewModel: ParameterFactory<String, PhotoDetailsViewModel> {
        self { photoId in
            PhotoDetailsViewModel(photoDetailUseCase: self.photoDetailsUseCase(), photoId: photoId)
        }
    }
}
