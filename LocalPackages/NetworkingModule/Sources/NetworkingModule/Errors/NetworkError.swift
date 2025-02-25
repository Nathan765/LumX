//
//  NetworkError.swift
//  NetworkingModule
//
//  Created by Nathan Stéphant on 19/02/2025.
//

import Foundation

public enum NetworkError: Error { // WIP
    case requestFailed(Error)
    case invalidResponse
    case noData
    case decodingFailed(Error)
}
