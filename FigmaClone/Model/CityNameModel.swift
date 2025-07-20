//
//  CityNameModel.swift
//  FigmaClone
//
//  Created by Alkit Gupta on 10/07/25.
//

import Foundation


// MARK: - CityNameModel
struct CityNameModel: Codable, Equatable, Hashable {
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

//typealias CityName = [CityNameModel]

struct CityNameModelResponseResource {

    func getCityDetails(query: String, completionHandler:@escaping(_ result: [CityNameModel]?)->Void) {
        var urlRequest = URLRequest(url: URL(string: buildSearchCityURL(query: query))!)
        urlRequest.httpMethod = "get"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")

        HttpUtility.shared.getData(request: urlRequest, resultType: [CityNameModel].self) { response in
            _ = completionHandler(response)
        }
    }
}
