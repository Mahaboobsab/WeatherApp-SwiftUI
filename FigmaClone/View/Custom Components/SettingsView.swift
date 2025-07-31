//
//  SettingsView.swift
//  FigmaClone
//
//  Created by Alkit Gupta on 31/07/25.
//

import SwiftUI

struct SettingsView: View {
    @State private var temperatureUnit = "°C"
    @State private var windSpeedUnit = "Kilometers per hour (km/h)"
    @State private var pressureUnit = "Millibar (mbar)"
    @State private var updateAtNight = false

    var body: some View {
        NavigationView {
            Form {
                // 🌡️ Units Section
                Section(header: Text("Units")) {
                    Picker("Temperature units", selection: $temperatureUnit) {
                        Text("°C").tag("°C")
                        Text("°F").tag("°F")
                    }
                    Picker("Wind speed units", selection: $windSpeedUnit) {
                        Text("Kilometers per hour (km/h)").tag("Kilometers per hour (km/h)")
                        Text("Miles per hour (mph)").tag("Miles per hour (mph)")
                    }
                    Picker("Atmospheric pressure units", selection: $pressureUnit) {
                        Text("Millibar (mbar)").tag("Millibar (mbar)")
                        Text("Pascal (Pa)").tag("Pascal (Pa)")
                    }
                }

                // 🌙 Other Settings Section
                Section(header: Text("Other settings")) {
                    Toggle(isOn: $updateAtNight) {
                        Text("Update at night automatically")
                    }
                    Text("Update weather info between 23:00 and 07:00")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }

                // 📄 About Section
                Section(header: Text("About Weather")) {
                    NavigationLink(destination: FeedbackView()) {
                        Text("Feedback")
                    }
                    NavigationLink(destination: PrivacyPolicyView()) {
                        Text("Privacy Policy")
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

// 🗣️ Feedback View
struct FeedbackView: View {
    var body: some View {
        Text("Feedback")
            .navigationBarTitle("Feedback", displayMode: .inline)
    }
}

// 🔐 Privacy Policy View

struct PrivacyPolicyView: View {
    var body: some View {
        WebView(url: URL(string: "https://www.worldweatheronline.com/weather-api/")!)
            .navigationBarTitle("Privacy Policy", displayMode: .inline)
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

