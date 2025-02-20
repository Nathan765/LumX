//
//  ImageDetailViewModel.swift
//  LumX
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import Foundation
import NetworkingModule

class ImageDetailViewModel: ObservableObject {
    @Published var photoURL: String
    @Published var descriptionText: String
    
    init(photo: Photo) {
        self.photoURL = photo.urls.full
        self.descriptionText = photo.description ?? "No description"
    }
}
