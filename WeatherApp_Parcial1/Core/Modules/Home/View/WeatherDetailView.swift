import SwiftUI

struct WeatherDetailView: View {
    @EnvironmentObject var viewModel: WeatherViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text("Detalles del Clima")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                
                VStack {
                        AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(viewModel.weatherResponse?.weatherInfo?.first(where: {$0.description != nil})?.description?.code ?? "")@2x.png"))
                        { result in
                            switch result {
                            case .empty:
                                RoundedRectangle(cornerRadius: 21)
                                    .frame(width: 20, height: 20)
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFill()
                            case .failure(_):
                                RoundedRectangle(cornerRadius: 21)
                                    .frame(width: 20, height: 20)
                            @unknown default:
                                RoundedRectangle(cornerRadius: 21)
                                    .frame(width: 20, height: 20)
                            }
                        }
                        .frame(width: 200, height: 200)
                }
                
                WeatherInfoView(
                    fistTitle: "País:",
                    secondTitle: "Ciudad:",
                    firstContent: "\(viewModel.weatherResponse?.weatherPlaceInfo?.country ?? "No información")",
                    secondContent: "\(viewModel.weatherResponse?.name ?? "No información")"
                )
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
                
                WeatherInfoView(
                    fistTitle: "Temperatura:",
                    secondTitle: "Humedad:",
                    firstContent: "\(viewModel.weatherResponse?.weatherTemperature?.temperature ?? 0.0)°",
                    secondContent: "\(viewModel.weatherResponse?.weatherTemperature?.humidity ?? 0.0)%"
                )
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
                
                WeatherInfoView(
                    fistTitle: "Descripción:",
                    secondTitle: "Estado:",
                    firstContent: "\(viewModel.weatherResponse?.weatherInfo?.first(where: { $0.description != nil})?.description?.rawValue ?? "No hay Descripción")",
                    secondContent: "\(viewModel.weatherResponse?.weatherInfo?.first(where: { $0.currentStatus != nil})?.currentStatus ?? "No hay estado")"
                )
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
                
                WeatherInfoView(
                    fistTitle: "Latitud:",
                    secondTitle: "Longitud:",
                    firstContent: "\(viewModel.latitude)",
                    secondContent: "\(viewModel.longitude)"
                )
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
                
            }
            .alert(viewModel.errorMessage, isPresented: $viewModel.showAlert) {
                Button("OK") {
                    presentationMode.wrappedValue.dismiss()
                    viewModel.clearState()
                }
            }
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .topTrailing) {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.red)
                    .frame(width: 150, height: 50)
                    .overlay {
                        Text(viewModel.countdownText)
                            .font(.caption)
                            .foregroundStyle(.white)
                    }
            }
            
            if viewModel.isLoading {
                LoadingView()
                    .edgesIgnoringSafeArea(.all)
            }
            
        }
        .onAppear {
            Task {
                viewModel.beginTimer()
                try await viewModel.getWeatherInformation()
            }
        }
        .navigationTitle("Detalles")
    }
}

import SwiftUI

struct WeatherInfoView: View {
    var fistTitle: String
    var secondTitle: String
    var firstContent: String
    var secondContent: String
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.green)
                .overlay {
                    HStack {
                        Text(fistTitle)
                        Text(firstContent)
                    }
                    .font(.system(size: 12))
                    .padding(.horizontal)
                }
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.green)
                .overlay {
                    HStack {
                        Text(secondTitle)
                        Text(secondContent)
                    }
                    .font(.system(size: 12))
                    .padding(.horizontal)
                }
        }
    }
}

#Preview {
    WeatherDetailView().environmentObject(WeatherViewModel())
}
