//
//  CitySearchView.swift
//  FigmaClone
//
//  Created by Alkit Gupta on 14/07/25.
//

import SwiftUI

struct CitySearchView: View {
    @State private var cityName: String = ""
    @ObservedObject var cityViewModel = SearchCityViewModel()
    @Environment(\.dismiss) var dismiss
    @Binding var selectedCity: CityNameModel?
    
    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(
                gradient: Gradient(colors: [Color.purple, Color.blue]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            VStack() {
                HStack() {
                    TextField("Enter city name", text: $cityName)
                        .padding(10)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Button("Search", action: {
                        cityViewModel.loadCityData(query: cityName)
                        
                    })
                    .padding(10)
                    .background(Color.yellow)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }.padding()
                
                List {
                    if let cities = cityViewModel.cityNameModelDetails {
                        ForEach(cities, id: \.self) { city in
                            SearchResultView(title: city.name, subtitle: city.country)
                                .listRowBackground(Color.white.opacity(0.2)).onTapGesture {
                                    handleCitySelection(city)
                                }
                        }.onDelete(perform: deleteCity(at:))
                    } else {
                        Text("No cities found")
                            .foregroundColor(.gray)
                    }
                }
                .listRowBackground(Color.clear) // 🧼 Clears row backgrounds
                .scrollContentBackground(.hidden)
                
            }
            .onAppear {
                if cityViewModel.loadPreviousData() == nil {
                    cityViewModel.loadCityData(query: "Bengaluru")
                }
            }
            // 🔄 Loading Overlay
            if cityViewModel.isLoading {
                LoadingView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
    
    private func deleteCity(at offsets: IndexSet) {
        if var cities = cityViewModel.cityNameModelDetails {
            let removedCities = offsets.map { cities[$0] }
            // Now delete them
            cities.remove(atOffsets: offsets)
            cityViewModel.cityNameModelDetails = cities
            
            // You can now do something with removedCities
            print("Deleted cities: \(removedCities)")
            for city in removedCities {
                cityViewModel.deleteSearchResult(data: city)
            }
        }
    }

    
    private func handleCitySelection(_ city: CityNameModel) {
        print("Selected city:", city.name)
        selectedCity = city
        cityViewModel.saveSearchResult(data: city)
        dismiss()
    }
}

struct CitySearchView_Previews: PreviewProvider {
    static var previews: some View {
        CitySearchView(selectedCity: .constant(nil))
    }
}

