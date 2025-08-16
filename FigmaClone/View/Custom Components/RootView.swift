//
//  RootView.swift
//  FigmaClone
//
//  Created by Alkit Gupta on 16/08/25.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var themeManager: ThemeManager

    var body: some View {
        SettingsView()
            .preferredColorScheme(themeManager.selectedTheme.colorScheme)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
