//
//  ErrorHandler.swift
//  WeatherApp_Parcial1
//
//  Created by Gabriel Campos on 20/8/24.
//

import Foundation

enum ErrorHandler: Error {
    case failedRequest(statusCode: Int)
    case unexpectedResponseType
    case failDecodingData
    case coordinatesNotValid

    var errorMessage: String {
        switch self {
        case .failedRequest(let statusCode):
            return "Request Failed with status code: \(statusCode)"
        case .unexpectedResponseType:
            return "Unexpected Response Type"
        case .failDecodingData:
            return "Failure Decoding Data"
        case .coordinatesNotValid:
            return "Coordinates not valid"
        }
    }
}
