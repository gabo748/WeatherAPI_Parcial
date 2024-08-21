import Foundation

@MainActor
final class WeatherViewModel: ObservableObject {
    // MARK: - Dependencies
    typealias Dependencies = HasWeatherInfoService
    
    // MARK: - Published Properties
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var errorMessage = ""
    @Published var weatherResponse: WeatherResponse? {
        didSet {
            print("CODE \(weatherResponse?.weatherInfo?.first?.description?.code ?? "NO CODE")")
        }
    }
    @Published var latitude = ""
    @Published var longitude = ""
    @Published var lastUpdateTime: Date? = nil
    @Published var countdownText: String = "Actualización en\n 30 segundos"
    
    // MARK: - Properties
    private var weatherInfoService: WeatherInfoServiceType
    private var timerManager: TimerManager?
    private var countdownTimer: Timer?
    private let countdownInterval: TimeInterval = 30.0
    
    // MARK: - Initializer
    init(dependencies: Dependencies = WeatherViewModelDependencies()) {
        self.weatherInfoService = dependencies.weatherInfoService
    }
    
    deinit {
        timerManager?.stop()
        countdownTimer?.invalidate()
    }
    
    // MARK: - Methods
    func getWeatherInformation() async {
        do {
            isLoading = true
            weatherResponse = try await weatherInfoService.getWeatherInformation(
                with: .init(
                    latitude: Double(latitude) ?? 0.0,
                    longitude: Double(longitude) ?? 0.0
                )
            )
            lastUpdateTime = Date()
            isLoading = false
            resetCountdown()
        } catch {
            isLoading = false
            errorMessage = error.localizedDescription
        }
    }
    
    func beginTimer() {
        setupTimer()
        startCountdown()
    }
    
    private func setupTimer() {
        timerManager = TimerManager(interval: countdownInterval) { [weak self] in
            Task {
                await self?.getWeatherInformation()
            }
        }
        timerManager?.start()
    }
    
    private func startCountdown() {
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.updateCountdown()
        }
    }
    
    private func updateCountdown() {
        guard let lastUpdateTime = lastUpdateTime else {
            countdownText = "Actualización en \(Int(countdownInterval)) segundos"
            return
        }
        
        let elapsed = Date().timeIntervalSince(lastUpdateTime)
        let remaining = max(countdownInterval - elapsed, 0)
        let seconds = Int(remaining)
        
        countdownText = "Actualización en \(seconds) segundos"
        
        if remaining <= 0 {
            resetCountdown()
        }
    }
    
    private func resetCountdown() {
        lastUpdateTime = Date()
    }
}

struct WeatherViewModelDependencies: WeatherViewModel.Dependencies {
    var weatherInfoService: WeatherInfoServiceType = WeatherInfoService()
}

extension WeatherViewModel {
    var areCoordinatesValid: Bool {
        return !latitude.isEmpty && !longitude.isEmpty
    }
}
