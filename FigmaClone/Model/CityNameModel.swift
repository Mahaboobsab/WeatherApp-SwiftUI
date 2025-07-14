//
//  CityNameModel.swift
//  FigmaClone
//
//  Created by Alkit Gupta on 10/07/25.
//

import Foundation


// MARK: - CityNameModel
struct CityNameModel: Codable {
    let name: String
    let localNames: [String: String]?
    let lat, lon: Double
    let country, state: String

    enum CodingKeys: String, CodingKey {
        case name
        case localNames = "local_names"
        case lat, lon, country, state
    }
}

typealias CityName = [CityNameModel]
