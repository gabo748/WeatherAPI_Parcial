import Foundation
import Combine

@MainActor
final class WeatherViewModel: ObservableObject {
    // MARK: - Dependencies
    typealias Dependencies = HasWeatherInfoService
    
    // MARK: - Published Properties
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var errorMessage = ""
    @Published var weatherResponse: WeatherResponse?
    @Published var latitude = "13.6929"
    @Published var longitude = "89.2182"
    @Published var lastUpdateTime: Date? = nil  // New property to track last update time
    
    // MARK: - Properties
    private var weatherInfoService: WeatherInfoServiceType
    private var timer: Timer?
    
    // MARK: - Initializer
    init(dependencies: Dependencies = WeatherViewModelDependencies()) {
        self.weatherInfoService = dependencies.weatherInfoService
    }
    
    deinit {
        timer?.invalidate()
    }
    
    func getWeatherInformation() async {
        do {
            isLoading = true
            weatherResponse = try await weatherInfoService.getWeatherInformation(
                with: .init(
                    latitude: Double(latitude) ?? 0.0,
                    longitude: Double(longitude) ?? 0.0
                )
            )
            isLoading = false
            lastUpdateTime = Date()  // Update the last update time
        } catch {
            isLoading = false
            print("ERROR \(error)")
            errorMessage = error.localizedDescription
        }
    }
    
    private func startWeatherUpdateTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 30, repeats: true) { _ in
            Task {
                await self.getWeatherInformation()
            }
        }
    }
}

extension WeatherViewModel {
    var areCoordinatesValid: Bool {
        return !latitude.isEmpty && !longitude.isEmpty
    }
}


struct WeatherViewModelDependencies: WeatherViewModel.Dependencies {
    var weatherInfoService: WeatherInfoServiceType = WeatherInfoService()
}
