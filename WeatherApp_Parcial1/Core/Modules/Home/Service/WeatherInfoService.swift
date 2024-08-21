//
//  WeatherInfoService.swift
//  WeatherApp_Parcial1
//
//  Created by Gabriel Campos on 20/8/24.
//

import Foundation
import CoreLocation

// MARK: - Protocol for DI
protocol HasWeatherInfoService {
    var weatherInfoService: WeatherInfoServiceType { get set }
}

// MARK: -  Protocol
protocol WeatherInfoServiceType {
    func getWeatherInformation(with coordinates: CLLocationCoordinate2D) async throws -> WeatherResponse
}

// MARK: - Implementation
struct WeatherInfoService: WeatherInfoServiceType {
    // MARK: - Dependencies
    typealias Dependencies = HasNetworkProvider
    
    // MARK: - Properties
    private var networkProvider: NetworkProviderType
    
    // MARK: - Initializer
    init(dependencies: Dependencies = WeatherInfoServiceDependencies()) {
        self.networkProvider = dependencies.networkProvider
    }
    
    func getWeatherInformation(with coordinates: CLLocationCoordinate2D) async throws -> WeatherResponse {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=3f6cfd9cc49fbf54bd6ca94d8247b9cc")!
        let request = URLRequest(url: url)
        let response: WeatherResponse = try await networkProvider.perform(for: request)
        print("## \(response)")
        return response
    }
}

struct WeatherInfoServiceDependencies: WeatherInfoService.Dependencies {
    var networkProvider: NetworkProviderType = NetworkProvider()
}
