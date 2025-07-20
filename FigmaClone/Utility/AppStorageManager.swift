//
//  PersistenceManager.swift
//  FigmaClone
//
//  Created by Alkit Gupta on 20/07/25.
//

import SwiftUI

final class AppStorageManager {
    
    static let shared = AppStorageManager()
    private init() {}

    func save<T: Codable & Equatable>(_ value: T, forKey key: String) {
        var values = load(key, as: T.self) ?? []
        guard !values.contains(value) else { return }
        values.append(value)
        if let data = try? JSONEncoder().encode(values) {
            UserDefaults.standard.set(String(data: data, encoding: .utf8), forKey: key)
        }
    }
    
    func load<T: Codable>(_ key: String, as type: T.Type) -> [T]? {
        guard let jsonString = UserDefaults.standard.string(forKey: key),
              let data = jsonString.data(using: .utf8) else { return nil }

        return try? JSONDecoder().decode([T].self, from: data)
    }
    
    func remove(_ key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}

