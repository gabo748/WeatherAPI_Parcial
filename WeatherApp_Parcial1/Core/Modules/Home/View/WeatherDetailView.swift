//
//  WeatherDetailView.swift
//  WeatherApp_Parcial1
//
//  Created by Gabriel Campos on 20/8/24.
//

import SwiftUI

struct WeatherDetailView: View {
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Detalles del Clima")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 40)
            
            Text("Latitud: \(viewModel.latitude)")
            Text("Longitud: \(viewModel.longitude)")
            
            Spacer()
        }
        .navigationTitle("Detalles")
        .background(Color(.systemGray6).edgesIgnoringSafeArea(.all))
    }
}

struct WeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailView().environmentObject(WeatherViewModel())
    }
}
