//
//  NetworkProvider.swift
//  idigitalStudios-TechnicalTest
//
//  Created by Gabriel Campos
//

import Foundation
import Combine

// MARK: Protocol for DI
protocol HasNetworkProvider {
    var networkProvider: NetworkProviderType { get set }
}

// MARK: - Conformance
protocol NetworkProviderType {
    func perform<Value: Decodable>(
        for request: URLRequest
    ) async throws -> Value
}

// MARK: - Implementation
struct NetworkProvider: NetworkProviderType {
    func perform<Value: Decodable>(
        for request: URLRequest
    ) async throws -> Value {
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse else {
            throw ErrorHandler.unexpectedResponseType
        }
        
        guard (200...299).contains(response.statusCode) else {
            throw ErrorHandler.failedRequest(statusCode: response.statusCode)
        }
        
        let decodedData = try JSONDecoder().decode(Value.self, from: data)

        return decodedData
    }
}
