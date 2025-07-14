import Foundation

class WeatherViewModel: ObservableObject {
    
    @Published var weatherDetails: WeatherResponse?
    @Published var cityDetails: CityModel?
    @Published var isLoading: Bool = false

    // Call both APIs within one unified task
    func loadAllWeatherData() {
        isLoading = true

        let group = DispatchGroup()

        group.enter()
        WeatherResponseResource().getWeatherDetails { result in
            DispatchQueue.main.async {
                self.weatherDetails = result
                group.leave()
            }
        }

        group.enter()
        CityResponseResource().getWeatherDetails { result in
            DispatchQueue.main.async {
                self.cityDetails = result
                group.leave()
            }
        }

        group.notify(queue: .main) {
            self.isLoading = false
        }
    }
}
