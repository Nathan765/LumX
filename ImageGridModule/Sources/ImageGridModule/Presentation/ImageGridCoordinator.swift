//
//  ImageGridCoordinator.swift
//  ImageGridModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

import NetworkingModule

public protocol ImageGridCoordinator: AnyObject {
    func showDetail(for photo: Photo)
}
