//
//  CityModel.swift
//  FigmaClone
//
//  Created by Alkit Gupta on 08/07/25.
//

import Foundation

// MARK: - Welcome
struct CityModel: Codable {
    let data: DataClass
   }

   // MARK: - DataClass
   struct DataClass: Codable {
       let request: [Request]
       let currentCondition: [CurrentCondition]
       let weather: [WeatherElement]
       let climateAverages: [ClimateAverage]

       enum CodingKeys: String, CodingKey {
           case request
           case currentCondition = "current_condition"
           case weather
           case climateAverages = "ClimateAverages"
       }
   }

   // MARK: - ClimateAverage
   struct ClimateAverage: Codable {
       let month: [Month]
   }

   // MARK: - Month
   struct Month: Codable {
       let index, name, avgMinTemp, avgMinTempF: String
       let absMaxTemp, absMaxTempF, avgDailyRainfall: String

       enum CodingKeys: String, CodingKey {
           case index, name, avgMinTemp
           case avgMinTempF = "avgMinTemp_F"
           case absMaxTemp
           case absMaxTempF = "absMaxTemp_F"
           case avgDailyRainfall
       }
   }

   // MARK: - CurrentCondition
   struct CurrentCondition: Codable {
       let observationTime, tempC, tempF, weatherCode: String
       let weatherIconURL, weatherDesc: [Weather2]
       let windspeedMiles, windspeedKmph, winddirDegree: String
       let winddir16Point: Winddir16Point
       let precipMM, precipInches, humidity, visibility: String
       let visibilityMiles, pressure, pressureInches, cloudcover: String
       let feelsLikeC, feelsLikeF, uvIndex: String

       enum CodingKeys: String, CodingKey {
           case observationTime = "observation_time"
           case tempC = "temp_C"
           case tempF = "temp_F"
           case weatherCode
           case weatherIconURL = "weatherIconUrl"
           case weatherDesc, windspeedMiles, windspeedKmph, winddirDegree, winddir16Point, precipMM, precipInches, humidity, visibility, visibilityMiles, pressure, pressureInches, cloudcover
           case feelsLikeC = "FeelsLikeC"
           case feelsLikeF = "FeelsLikeF"
           case uvIndex
       }
   }

   // MARK: - Weather
   struct Weather2: Codable {
       let value: String
   }

   enum Winddir16Point: String, Codable {
       case nw = "NW"
       case w = "W"
       case wnw = "WNW"
       case wsw = "WSW"
   }

   // MARK: - Request
   struct Request: Codable {
       let type, query: String
   }

   // MARK: - WeatherElement
   struct WeatherElement: Codable {
       let date: String
       let astronomy: [Astronomy]
       let maxtempC, maxtempF, mintempC, mintempF: String
       let avgtempC, avgtempF, totalSnowCM, sunHour: String
       let uvIndex: String
       let hourly: [Hourly]

       enum CodingKeys: String, CodingKey {
           case date, astronomy, maxtempC, maxtempF, mintempC, mintempF, avgtempC, avgtempF
           case totalSnowCM = "totalSnow_cm"
           case sunHour, uvIndex, hourly
       }
   }

   // MARK: - Astronomy
   struct Astronomy: Codable {
       let sunrise, sunset, moonrise, moonset: String
       let moonPhase, moonIllumination: String

       enum CodingKeys: String, CodingKey {
           case sunrise, sunset, moonrise, moonset
           case moonPhase = "moon_phase"
           case moonIllumination = "moon_illumination"
       }
   }

   // MARK: - Hourly
   struct Hourly: Codable {
       let time, tempC, tempF, windspeedMiles: String
       let windspeedKmph, winddirDegree: String
       let winddir16Point: Winddir16Point
       let weatherCode: String
       let weatherIconURL, weatherDesc: [Weather2]
       let precipMM, precipInches, humidity, visibility: String
       let visibilityMiles, pressure, pressureInches, cloudcover: String
       let heatIndexC, heatIndexF, dewPointC, dewPointF: String
       let windChillC, windChillF, windGustMiles, windGustKmph: String
       let feelsLikeC, feelsLikeF, chanceofrain, chanceofremdry: String
       let chanceofwindy, chanceofovercast, chanceofsunshine, chanceoffrost: String
       let chanceofhightemp, chanceoffog, chanceofsnow, chanceofthunder: String
       let uvIndex, shortRAD, diffRAD: String

       enum CodingKeys: String, CodingKey {
           case time, tempC, tempF, windspeedMiles, windspeedKmph, winddirDegree, winddir16Point, weatherCode
           case weatherIconURL = "weatherIconUrl"
           case weatherDesc, precipMM, precipInches, humidity, visibility, visibilityMiles, pressure, pressureInches, cloudcover
           case heatIndexC = "HeatIndexC"
           case heatIndexF = "HeatIndexF"
           case dewPointC = "DewPointC"
           case dewPointF = "DewPointF"
           case windChillC = "WindChillC"
           case windChillF = "WindChillF"
           case windGustMiles = "WindGustMiles"
           case windGustKmph = "WindGustKmph"
           case feelsLikeC = "FeelsLikeC"
           case feelsLikeF = "FeelsLikeF"
           case chanceofrain, chanceofremdry, chanceofwindy, chanceofovercast, chanceofsunshine, chanceoffrost, chanceofhightemp, chanceoffog, chanceofsnow, chanceofthunder, uvIndex
           case shortRAD = "shortRad"
           case diffRAD = "diffRad"
       }
   }


struct CityResponseResource {

    func getWeatherDetails(completionHandler:@escaping(_ result: CityModel?)->Void) {

        var urlRequest = URLRequest(url: URL(string: buildCityURL())!)
        urlRequest.httpMethod = "get"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        print(urlRequest)
        HttpUtility.shared.getData(request: urlRequest, resultType: CityModel.self) { response in
            _ = completionHandler(response)
        }
    }
}
