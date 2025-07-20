//
//  PersistenceManager.swift
//  FigmaClone
//
//  Created by Alkit Gupta on 20/07/25.
//

import SwiftUI

import Foundation

final class AppStorageManager {
    
    static let shared = AppStorageManager()
    private init() {}

    func save<T: Codable & Equatable>(_ value: T, forKey key: String) {
        var existingValues: [T] = []

        if let existingJSON = UserDefaults.standard.string(forKey: key),
           let existingData = existingJSON.data(using: .utf8),
           let decoded = try? JSONDecoder().decode([T].self, from: existingData) {
            existingValues = decoded
        }

        // 🔍 Check for duplicates
        if !existingValues.contains(value) {
            existingValues.append(value)

            if let newData = try? JSONEncoder().encode(existingValues),
               let newJSON = String(data: newData, encoding: .utf8) {
                UserDefaults.standard.set(newJSON, forKey: key)
            }
        }
    }

    func load<T: Codable>(_ key: String, as type: T.Type) -> [T]? {
       // let models = try JSONDecoder().decode([CityNameModel].self, from: data)

        guard let jsonString = UserDefaults.standard.string(forKey: key),
              let data = jsonString.data(using: .utf8) else {
            return nil
        }

        do {
            let decoded = try JSONDecoder().decode([T].self, from: data)
            return decoded
        } catch {
            print("❌ Decoding failed:", error)
            return nil
        }
    }


    func remove(_ key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}

