//
//  ImageGridViewModel.swift
//  LumX
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import Foundation
import Combine

public class ImageGridViewModel {
    private let photoListUseCase: any PhotoListUseCase
    private var currentPage = 1
    private var isLoading = false
    
    @Published public private(set) var photos: [PhotoUIModel] = []
    @Published public private(set) var errorMessage: String?
    
    private var reloadSubject = PassthroughSubject<Void, Never>()
    public var reloadPublisher: AnyPublisher<Void, Never> {
        reloadSubject.eraseToAnyPublisher()
    }
    
    private var cancellables = Set<AnyCancellable>()

    public init(photoListUseCase: PhotoListUseCase) {
        self.photoListUseCase = photoListUseCase
    }
    
    public func fetchImages() async {
        guard !isLoading else { return }
        isLoading = true
        
        do {
            let newPhotos = try await photoListUseCase.execute(page: currentPage, perPage: 30)
            
            let uniquePhotos = newPhotos.filter { newPhoto in
                !self.photos.contains(where: { $0.id == newPhoto.id })
            }.map { PhotoUIModel(entity: $0) }
            
            if !uniquePhotos.isEmpty {
                self.photos.append(contentsOf: uniquePhotos)
                self.currentPage += 1
                reloadSubject.send()
            }
        } catch {
            errorMessage = "❌ Error fetching images: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
}
