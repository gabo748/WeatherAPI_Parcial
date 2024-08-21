import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = WeatherViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Agrega las coordenadas")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                
                Text("Desde nuestra aplicación puedes ver el clima únicamente colocando las coordenadas")
                    .multilineTextAlignment(.center)
                
                VStack(spacing: 15) {
                    TextField("Latitud", text: $viewModel.latitude)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 20)
                        .keyboardType(.decimalPad)
                    
                    TextField("Longitud", text: $viewModel.longitude)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 20)
                        .keyboardType(.decimalPad)
                }
                .padding(.bottom, 20)
                
                NavigationLink(destination: WeatherDetailView()
                                .environmentObject(viewModel)) {
                    Text("Ir a ver Detalles")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 20)
                .disabled(!viewModel.areCoordinatesValid)

                
                Spacer()
            }
            .background(Color(.systemGray6).edgesIgnoringSafeArea(.all))
        }
    }
}

struct CoordinateInputView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
