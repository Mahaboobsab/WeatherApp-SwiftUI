import SwiftUI

class WeatherViewModel: ObservableObject {
    
    @Published var weatherDetails: WeatherResponse?
    @Published var cityDetails: CityModel?
    @Published var isLoading: Bool = false
    @AppStorage("temperatureUnit") var temperatureUnitRaw = "°C"
    
    var temperatureUnit: TemperatureUnit {
        TemperatureUnit(rawValue: temperatureUnitRaw) ?? .celsius
    }
    
    var currentTemp: Int? {
        guard let kelvin = weatherDetails?.main.temp else { return nil }
        return Int(TemperatureHelper.fromKelvin(kelvin, to: temperatureUnit))
    }
    
    var maxMinTemp: (max: Int, min: Int)? {
        guard let maxKelvin = weatherDetails?.main.temp_max,
              let minKelvin = weatherDetails?.main.temp_min else { return nil }
        return (
            max: Int(TemperatureHelper.fromKelvin(maxKelvin, to: temperatureUnit)),
            min: Int(TemperatureHelper.fromKelvin(minKelvin, to: temperatureUnit))
        )
    }
    
    // Call both APIs within one unified task
    func loadAllWeatherData(cityModel: CityNameModel) {
        isLoading = true
        let group = DispatchGroup()
        group.enter()
        WeatherResponseResource().getWeatherDetails(lat: cityModel.lat, lon: cityModel.lon ) { result in
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
