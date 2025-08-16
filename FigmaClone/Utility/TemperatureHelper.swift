//
//  TemperatureHelper.swift
//  FigmaClone
//
//  Created by Alkit Gupta on 15/08/25.
//

import Foundation

enum TemperatureUnit: String {
    case celsius = "°C"
    case fahrenheit = "°F"
}

struct TemperatureHelper {
    static func fromKelvin(_ kelvin: Double, to unit: TemperatureUnit) -> Double {
        let celsius = kelvin - 273.15
        switch unit {
        case .celsius:
            return celsius
        case .fahrenheit:
            return (celsius * 9/5) + 32
        }
    }
}
