//
//  WeatherResponse.swift
//  WeatherApp_Parcial1
//
//  Created by Gabriel Campos on 20/8/24.
//

import Foundation

struct WeatherResponse: Decodable {
    let weatherInfo: [WeatherInfo]?
    let weatherTemperature: WeatherTemperature?
    let weatherPlaceInfo: WeatherPlaceInfo?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case weatherInfo =  "weather"
        case weatherTemperature = "main"
        case weatherPlaceInfo = "sys"
        case name
    }
}

struct WeatherInfo: Decodable {
    let id: Int?
    let description: String?
    let currentStatus: String?
    
    enum CodingKeys: String, CodingKey {
        case id, description
        case currentStatus = "main"
    }
}

struct WeatherTemperature: Decodable {
    let temperature: Double?
    let humidity: Double?
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case humidity
    }
}

struct WeatherPlaceInfo: Decodable {
    let id: Int?
    let country: String?
}

