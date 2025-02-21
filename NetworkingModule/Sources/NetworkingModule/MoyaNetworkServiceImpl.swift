//
//  MoyaNetworkServiceImpl.swift
//  NetworkingModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

import Moya

public class MoyaNetworkServiceImpl: NetworkService {
    private let provider: MoyaProvider<MultiTarget>
    
    public init(provider: MoyaProvider<MultiTarget> = MoyaProvider<MultiTarget>()) {
        self.provider = provider
    }
    
    public func request<D: Decodable, T: TargetType>(on endpoint: T) async throws -> D {
        let rawResponse = try await provider.asyncRequest(MultiTarget(endpoint))
        let filteredResponse = try rawResponse.filterSuccessfulStatusCodes()
        return try filteredResponse.map(D.self)
    }
}

extension MoyaProvider {
    func asyncRequest(_ target: Target) async throws -> Response {
        try await withCheckedThrowingContinuation { continuation in
            self.request(target) { result in
                switch result {
                case .success(let response):
                    continuation.resume(returning: Response(statusCode: response.statusCode, data: response.data, request: response.request, response: response.response))
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
