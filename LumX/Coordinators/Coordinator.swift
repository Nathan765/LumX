//
//  Coordinator.swift
//  LumX
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    
    func start()
}
