//
//  WeatherDashboardView.swift
//  FigmaClone
//
//  Created by Mahaboobsab Nadaf on 07/07/25.
//

import SwiftUI

import SwiftUI

struct WeatherDashboardView: View {
    @ObservedObject var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        ZStack {
            // Gradient Background
            LinearGradient(
                colors: [Color.purple, Color.blue],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 20) {

                // Main Weather Info
                VStack(spacing: 8) {
                    Image(systemName: "Dashboard")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)

                    
                    if let temp = weatherViewModel.weatherDetails?.main.temp {
                        Text("\(Int(297.15 - temp))°")
                            .font(.system(size: 64, weight: .bold))
                            .foregroundColor(.white)
                    }
                    if let max = weatherViewModel.weatherDetails?.main.temp_max, let min = weatherViewModel.weatherDetails?.main.temp_min {
                        Text("Precipitations\nMax: \(Int(297.15 - max))° Min: \(Int(297.15 - min))°")
                            .multilineTextAlignment(.center)
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }
                        Spacer()
                // Cozy House Image Placeholder
                Image("House") // Replace with your local asset name
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)

                // Forecast Section
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Today")
                            .font(.title3)
                            .foregroundColor(.white)
                        Spacer()
                        if let date = weatherViewModel.cityDetails?.data.weather.first?.date.getTodaysDate() {
                            Text(date)
                                .foregroundColor(.white)
                        }
                        
                    }

                    // Hourly Forecast
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForecastCard(hour: "15:00", temp: "19°C")
                            ForecastCard(hour: "16:00", temp: "18°C")
                            ForecastCard(hour: "17:00", temp: "18°C")
                            ForecastCard(hour: "18:00", temp: "18°C")
                        }
                        .padding(.vertical)
                    }
                }
                .padding()
                .background(Color.white.opacity(0.1))
                .cornerRadius(15)
                .padding(.horizontal)

                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .padding(.top)
            .onAppear{
               te weatherViewModel.getWeatherDetails()
                weatherViewModel.getCityDetails()
            }
        }
    }
}

struct ForecastCard: View {
    let hour: String
    let temp: String

    var body: some View {
        VStack(spacing: 6) {
            Text(hour)
                .font(.caption)
                .foregroundColor(.white)

            Image(systemName: "cloud.rain.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)

            Text(temp)
                .font(.caption)
                .foregroundColor(.white)
        }
        .frame(width: 60)
    }
}

struct WeatherDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDashboardView()
    }
}
