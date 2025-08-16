//
//  FigmaCloneApp.swift
//  FigmaClone
//
//  Created by Alkit Gupta on 05/07/25.
//

import SwiftUI
@main
struct FigmaCloneApp: App {
    // @AppStorage("selectedTheme") private var selectedTheme: AppTheme = .system
    @StateObject private var themeManager = ThemeManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(themeManager)
                .preferredColorScheme(themeManager.selectedTheme.colorScheme)
               
        }
    }
}
