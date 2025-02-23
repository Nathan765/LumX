//
//  ImageGridViewModel.swift
//  ImageGridModule
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import Foundation
import Combine

public class ImageGridViewModel {
    private let photoListUseCase: any PhotoListUseCase
    private let photoUIMapper: PhotoUIMapper
    
    private var currentPage = 1
    private var isLoading = false
    
    @Published public private(set) var photos: [PhotoUIModel] = []
    @Published public private(set) var errorMessage: String?
    
    private var reloadSubject = PassthroughSubject<Void, Never>()
    public var reloadPublisher: AnyPublisher<Void, Never> {
        reloadSubject.eraseToAnyPublisher()
    }
    
    private var cancellables = Set<AnyCancellable>()

    public init(photoListUseCase: PhotoListUseCase, photoUIMapper: PhotoUIMapper) {
        self.photoListUseCase = photoListUseCase
        self.photoUIMapper = photoUIMapper
    }
    
    public func fetchImages() async {
        guard !isLoading else { return }
        isLoading = true
        
        do {
            let newPhotos = try await photoListUseCase.execute(page: currentPage, perPage: 30)
            
            let uniquePhotos = newPhotos.filter { newPhoto in
                !self.photos.contains(where: { $0.id == newPhoto.id })
            }
            
            let mappedPhotos = photoUIMapper.map(from: uniquePhotos)
            
            if !uniquePhotos.isEmpty {
                self.photos.append(contentsOf: mappedPhotos)
                self.currentPage += 1
                reloadSubject.send()
            }
        } catch {
            errorMessage = "❌ Error fetching images: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
}
