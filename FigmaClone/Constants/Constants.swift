//
//  Constants.swift
//  FigmaClone
//
//  Created by Alkit Gupta on 08/07/25.
//

import Foundation

struct API {
    static let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    static let apiKey = "f32f36efd5c0cefa353f90cb87fa26d5"
}

struct Location {
    static let defaultLatitude = 44.34
    static let defaultLongitude = 10.99
}

func buildWeatherURL(lat: Double = Location.defaultLatitude, lon: Double = Location.defaultLongitude) -> String {
    return "\(API.baseURL)?lat=\(lat)&lon=\(lon)&appid=\(API.apiKey)"
}

func buildCityURL() -> String {
    return "https://api.worldweatheronline.com/premium/v1/weather.ashx?key=0494752a675946e292d55629160406&q=Bangalore&format=json&num_of_days=5"
}

func buildSearchCityURL(query: String) -> String {
    return "https://api.openweathermap.org/geo/1.0/direct?q=\(query)&limit=100&appid=f32f36efd5c0cefa353f90cb87fa26d5&countrycode=IN"
}
//
