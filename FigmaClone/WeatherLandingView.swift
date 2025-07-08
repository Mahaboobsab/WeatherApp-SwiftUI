//
//  Dashboard.swift
//  FigmaClone
//
//  Created by Alkit Gupta on 07/07/25.
//

import SwiftUI

struct WeatherLandingView: View {
    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(
                gradient: Gradient(colors: [Color.purple, Color.blue]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 30) {
                Spacer(minLength: 40)

                // Weather Icon (System image used as placeholder)
                Image(systemName: "cloud.sun.rain.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .shadow(radius: 10)

                // Title Text
                VStack(spacing: 5) {
                    Text("Weather")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Text("ForeCasts")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                }

                Spacer()

                // Get Start Button
                Button(action: {
                    // TODO: Add navigation or functionality
                }) {
                    Text("Get Start")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 12)
                        .background(Color.yellow)
                        .clipShape(Capsule())
                }

                Spacer(minLength: 40)
            }
            .padding()
        }
    }
}

struct WeatherLandingView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherLandingView()
    }
}
