//
//  WeatherDashboardView.swift
//  FigmaClone
//
//  Created by Mahaboobsab Nadaf on 07/07/25.
//

import SwiftUI

struct WeatherDashboardView: View {
    @ObservedObject var weatherViewModel = WeatherViewModel()
    let hours = ["12:00", "03:00", "06:00", "09:00"]
    
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
                Image("house (1)") // Replace with your local asset name
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
                        if let date = weatherViewModel.cityDetails?.data.weather.first?.date.getFormattedDate() {
                            Text(date)
                                .foregroundColor(.white)
                        }
                        
                    }
                    
                    // Hourly Forecast
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            //                                                        if let first = weatherViewModel.cityDetails?.data.weather.first?.hourly.first?.tempC,
                            //                                                           let second = weatherViewModel.cityDetails?.data.weather.first?.hourly[1].tempC,
                            //                                                           let third = weatherViewModel.cityDetails?.data.weather.first?.hourly[2].tempC,
                            //                                                           let fourth = weatherViewModel.cityDetails?.data.weather.first?.hourly[3].tempC {
                            //                                                            ForecastCard(hour: "12:00", temp: "\(first)°C")
                            //                                                            ForecastCard(hour: "03:00", temp: "\(second)°C")
                            //                                                            ForecastCard(hour: "06:00", temp: "\(third)°C")
                            //                                                            ForecastCard(hour: "09:00", temp: "\(fourth)°C")
                            //                                                        }
                            
                            if let hourly = weatherViewModel.cityDetails?.data.weather.first?.hourly {
                                ForEach(Array(hourly.prefix(4).enumerated()), id: \.offset) { index, hourData in
                                    ForecastCard(hour: hours[index] , temp: "\(hourData.tempC)°C", imageUrl: "\(hourData.weatherIconURL.first?.value ?? "")")
                                }
                            }
                            
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
                weatherViewModel.loadAllWeatherData()
            }
            // 🔄 Loading Overlay
            if weatherViewModel.isLoading {
                LoadingView()
            }
        }
    }
}

