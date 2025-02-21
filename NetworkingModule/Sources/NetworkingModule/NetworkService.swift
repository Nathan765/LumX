//
//  NetworkService.swift
//  NetworkingModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

import Moya

public protocol NetworkService {
    func request<D: Decodable, T: TargetType>(on endpoint: T) async throws -> D
}
