//
//  WeatherResponse.swift
//  FigmaClone
//
//  Created by Alkit Gupta on 08/07/25.
//

import Foundation

import Foundation

// MARK: - Root Model
struct WeatherResponse: Codable {
    let coord: Coordinates
    let weather: [Weather]
    let base: String
    let main: MainWeather
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: System
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let lon: Double
    let lat: Double
}

// MARK: - Weather Info
struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
    
}

// MARK: - Temperature & Atmosphere
struct MainWeather: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
    let sea_level: Int?
    let grnd_level: Int?
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double?
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - System Info
struct System: Codable {
    let country: String
    let sunrise: Int
    let sunset: Int
}

struct WeatherResponseResource {

    func getWeatherDetails(lat:Double,
                           lon: Double,
                           completionHandler: @escaping(_ result: WeatherResponse?)->Void ) {

        var urlRequest = URLRequest(url: URL(string: buildWeatherURL(lat: lat, lon: lon))!)
        urlRequest.httpMethod = "get"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")

        HttpUtility.shared.getData(request: urlRequest, resultType: WeatherResponse.self) { response in
            _ = completionHandler(response)
        }
    }
}
