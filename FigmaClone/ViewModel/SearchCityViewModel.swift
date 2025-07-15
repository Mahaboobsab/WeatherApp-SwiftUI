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
        CityNameModelResponseResource().getCityDetails(query: query) { result in
            DispatchQueue.main.async {
                self.cityNameModelDetails = result
                self.isLoading = false
            }

        }
    }
}
