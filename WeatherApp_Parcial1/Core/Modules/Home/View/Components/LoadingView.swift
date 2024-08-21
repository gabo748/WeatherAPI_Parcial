//
//  LoadingView.swift
//  WeatherApp_Parcial1
//
//  Created by Gabriel Campos on 20/8/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            // Background color
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            // Spinner
            VStack(spacing: 20) {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .scaleEffect(2.0) // Adjust size
                Text("Loading...")
                    .font(.headline)
                    .padding(.top, 10)
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
