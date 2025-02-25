//
//  NetworkContainer.swift
//  NetworkingModule
//
//  Created by Nathan Stéphant on 25/02/2025.
//

import Factory

extension Container {
    var networkService: Factory<NetworkService> {
        self { URLSessionNetworkServiceImpl() }
            .shared
    }
    
    public var unsplashAPIService: Factory<UnsplashAPIServiceImpl> {
        self { UnsplashAPIServiceImpl(networkService: self.networkService()) }
            .shared
    }
}
