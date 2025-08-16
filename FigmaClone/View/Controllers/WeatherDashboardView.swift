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
    @State private var showSheet = false
    @State private var showSettings = false
    @State private var selectedCity: CityNameModel?
    @StateObject var locationManager = LocationManager()
    @AppStorage("temperatureUnit") private var temperatureUnit = "°C"
    @EnvironmentObject var themeManager: ThemeManager
    
    var body: some View {
        ZStack {
            // Gradient Background
            LinearGradient(
                colors: [Color.purple, Color.blue],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            VStack() {
                HStack {
                    Button(action: {
                        print("Search tapped!")
                        showSheet = true
                    }) {
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                            .padding(10)
                            .background(Color.white.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    }
                    
                    .padding()
                    
                    Button(action: {
                        print("Settings tapped!")
                        showSettings = true
                        
                    }) {
                        Image(systemName: "gear")
                            .font(.title2)
                            .padding(10)
                            .background(Color.white.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    }
                }
                
                // Main Weather Info
                VStack(spacing: 0) {
                    Image(systemName: "Dashboard")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                    
                    if let cityName = weatherViewModel.weatherDetails?.name {
                        Text(cityName)
                            .font(.system(size: 24, weight: .light))
                            .foregroundColor(.white)
                    }
                    
                    if let temp = weatherViewModel.currentTemp {
                        Text("\(temp)\(weatherViewModel.temperatureUnit.rawValue)")
                            .font(.system(size: 54, weight: .bold))
                            .foregroundColor(.white)
                    }

                    if let maxMin = weatherViewModel.maxMinTemp {
                        Text("Max: \(maxMin.max)\(weatherViewModel.temperatureUnit.rawValue) Min: \(maxMin.min)\(weatherViewModel.temperatureUnit.rawValue)")
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
                    Divider()
                        .frame(height: 1) // Thickness of the line
                        .background(Color.white) // Line color
                        .padding(.vertical, 10) // Space above and below
                    
                    // Hourly Forecast
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
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
            .sheet(isPresented: $showSheet) {
                CitySearchView(selectedCity: $selectedCity)
            }
            .sheet(isPresented: $showSettings) {
                SettingsView()
            }
            .navigationBarBackButtonHidden(true)
            .padding(.top)
            .onChange(of: showSheet) { newValue in
                if !newValue {
                    print("CitySearchView was dismissed!")
                    if let city = selectedCity {
                        weatherViewModel.loadAllWeatherData(cityModel: city)
                    } else {
                        weatherViewModel.loadAllWeatherData(cityModel: CityNameModel(name: "", localNames: nil, lat: 12.9629, lon: 77.5775, country: "", state: ""))
                    }
                }
            }
            .onReceive(locationManager.$location) { newLocation in
                if let coord = newLocation {
                    weatherViewModel.loadAllWeatherData(cityModel: CityNameModel(name: "", localNames: nil, lat: coord.latitude, lon: coord.longitude, country: "", state: ""))
                }
            }
            // 🔄 Loading Overlay
            if weatherViewModel.isLoading {
                LoadingView()
            }
        }
    }
}

