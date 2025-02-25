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
}
