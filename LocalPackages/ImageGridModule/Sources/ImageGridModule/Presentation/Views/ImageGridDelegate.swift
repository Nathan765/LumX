//
//  ImageGridDelegate.swift
//  ImageGridModule
//
//  Created by Nathan Stéphant on 23/02/2025.
//

import UIKit

public class ImageGridDelegate: NSObject, UICollectionViewDelegate {
    private weak var viewModel: ImageGridViewModel?
    private weak var coordinator: ImageGridCoordinator?

    public init(viewModel: ImageGridViewModel, coordinator: ImageGridCoordinator?) {
        self.viewModel = viewModel
        self.coordinator = coordinator
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedPhotoID = self.viewModel?.photos[indexPath.item].id else { return }
        self.coordinator?.showPhotoDetails(for: selectedPhotoID)
    }
    
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let viewModel = self.viewModel else { return }
        let thresholdIndex = viewModel.photos.count - 12
        if indexPath.item == thresholdIndex {
            Task { await viewModel.fetchImages() }
        }
    }
}
