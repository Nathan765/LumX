//
//  NetworkError.swift
//  LumX
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import Foundation

enum NetworkError: Error {
    case requestFailed(Error)
    case invalidResponse
    case noData
    case decodingFailed(Error)
}
