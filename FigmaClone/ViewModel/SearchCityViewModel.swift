//
//  SearchCityViewModel.swift
//  FigmaClone
//
//  Created by Alkit Gupta on 15/07/25.
//

import Foundation

class SearchCityViewModel: ObservableObject {
    
    @Published var cityNameModelDetails: [CityNameModel]?
    @Published var isLoading: Bool = false

    // Call both APIs within one unified task
    func loadCityData(query: String) {
        isLoading = true
        CityNameModelResponseResource().getCityDetails(query: query) { [weak self] result in
            DispatchQueue.main.async {
                self?.cityNameModelDetails = result
                self?.isLoading = false
            }
        }
    }
    
    func saveSearchResult(data: CityNameModel) {
        AppStorageManager.shared.save(data, forKey: "selectedCity")
    }
    
    func deleteSearchResult(data: CityNameModel) {
        AppStorageManager.shared.removeCity(data, forKey: "selectedCity")
    }
    
    func loadPreviousData() -> [CityNameModel]? {
        if let loadedCity = AppStorageManager.shared.load("selectedCity", as: CityNameModel.self) {
            cityNameModelDetails = loadedCity
            return cityNameModelDetails
        } else {
            return nil
        }
    }
}
