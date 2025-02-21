//
//  NetworkService.swift
//  NetworkingModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

public protocol NetworkService {
    func request<D: Decodable, T: NetworkEndpoint>(on endpoint: T) async throws -> D
}
