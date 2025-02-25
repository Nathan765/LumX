//
//  PhotoGalleryCoordinator.swift
//  PhotoGalleryFeature
//
//  Created by Nathan Stéphant on 21/02/2025.
//

public protocol PhotoGalleryCoordinator: AnyObject {
    func showPhotoDetails(for photoId: String)
}
