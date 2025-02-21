//
//  ImageDetailViewModel.swift
//  LumX
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import Foundation
import Combine
import NetworkingModule

public class ImageDetailViewModel: ObservableObject {
    private let photoDetailUseCase: PhotoDetailUseCase
    private let photoId: String
    
    @Published public var photoURL: String = ""
    @Published public var descriptionText: String = "Loading..."
    @Published public var name: String = "Unknown"
    @Published public var isLoading: Bool = false

    public init(photoDetailUseCase: PhotoDetailUseCase, photoId: String) {
        self.photoDetailUseCase = photoDetailUseCase
        self.photoId = photoId
        Task {
            await fetchPhotoDetail()
        }
    }

    @MainActor
    public func fetchPhotoDetail() async {
        isLoading = true
        do {
            let photo = try await photoDetailUseCase.execute(photoId: photoId)
            self.photoURL = photo.urls.full
            self.descriptionText = photo.description ?? "No description"
            self.name = photo.user.name ?? "Anonymous"
        } catch {
            self.descriptionText = "Error loading photo"
        }
        isLoading = false
    }
}
