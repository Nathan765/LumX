//
//  ImageDetailViewModel.swift
//  LumX
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import Foundation
import NetworkingModule

public class ImageDetailViewModel: ObservableObject {
    @Published public var photoURL: String
    @Published public var descriptionText: String
    @Published public var name: String
    
    public init(photo: Photo) {
        self.photoURL = photo.urls.full
        self.descriptionText = photo.description ?? "no description"
        self.name = "Unknown"//photo.user.username ?? "Unknown"
    }
}
