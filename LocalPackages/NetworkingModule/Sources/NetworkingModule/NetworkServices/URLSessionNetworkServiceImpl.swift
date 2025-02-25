//
//  URLSessionNetworkServiceImpl.swift
//  NetworkingModule
//
//  Created by Nathan Stéphant on 21/02/2025.
//

import Foundation

public class URLSessionNetworkServiceImpl: NetworkService {
    public init() {}

    public func request<D: Decodable, T: NetworkEndpoint>(on endpoint: T) async throws -> D {
        var urlComponents = URLComponents(url: endpoint.baseURL.appendingPathComponent(endpoint.path), resolvingAgainstBaseURL: false)
        
        if let parameters = endpoint.parameters {
            urlComponents?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        }

        guard let url = urlComponents?.url else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        if let headers = endpoint.headers {
            headers.forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }
        }

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }

        let decoder = JSONDecoder()
        do {
            let decodedResponse = try decoder.decode(D.self, from: data)
            print("@@@ - Response: \n🔹 \(String(describing: try JSONSerialization.jsonObject(with: data, options: [])))")
            return decodedResponse
        } catch {
            throw error
        }
    }
}
