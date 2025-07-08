//
//  WeatherResonse+Imp.swift
//  FigmaClone
//
//  Created by Alkit Gupta on 08/07/25.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weatherDetails: WeatherResponse?
    @Published var cityDetails: CityModel?
    @Published var isLoading: Bool = false
    
    //call the api
    func getWeatherDetails() {
        isLoading = true
        WeatherResponseResource().getWeatherDetails { result in
            DispatchQueue.main.async {
                self.isLoading = false
                self.weatherDetails = result
            }
        }
    }
    
    func getCityDetails() {
       // isLoading = true
        CityResponseResource().getWeatherDetails { result in
            DispatchQueue.main.async {
               // self.isLoading = false
                self.cityDetails = result
            }
        }
    }
    
}

extension String {
    func getTodaysDate() -> String? {
        // Step 1: Create a DateFormatter to parse the input
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        if let date = inputFormatter.date(from: self) {
            // Step 2: Subtract one day
            let calendar = Calendar.current
            if let adjustedDate = calendar.date(byAdding: .day, value: -1, to: date) {
                // Step 3: Format the new date
                let outputFormatter = DateFormatter()
                outputFormatter.dateFormat = "MMMM d" // "July 7" format
                let formattedDate = outputFormatter.string(from: adjustedDate)
                print("Converted date: \(formattedDate)")
                return formattedDate
               
            }
        }
        return nil
    }

}
