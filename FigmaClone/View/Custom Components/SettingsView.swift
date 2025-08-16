//
//  SettingsView.swift
//  FigmaClone
//
//  Created by Alkit Gupta on 31/07/25.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("temperatureUnit") private var temperatureUnit = "°C"
    @EnvironmentObject var themeManager: ThemeManager

    
    @State private var pressureUnit = "Millibar (mbar)"
    @State private var updateAtNight = false
    @State private var showRateSheet = false
   
    
    var body: some View {
        NavigationView {
            Form {
                // 🌡️ Units Section
                Section(header: Text("Units")) {
                    
                    Picker("Temperature units", selection: $temperatureUnit) {
                        Text("°C").tag("°C")
                        Text("°F").tag("°F")
                    }
                    .onChange(of: temperatureUnit) { newValue in
                        print("Selected new temprature unit: \(newValue)")
                    }
                    
                    Picker("App theme", selection: $themeManager.selectedTheme) {
                        ForEach(AppTheme.allCases) { theme in
                            Text(theme.rawValue.capitalized).tag(theme)
                        }
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
                    Button("Feedback") {
                        showRateSheet = true
                    }.foregroundColor(.black)
                    .sheet(isPresented: $showRateSheet) {
                        RateWeatherView()
                            .presentationDetents([.fraction(0.4)]) // 40% height
                            //.presentationDragIndicator(.visible)
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
//struct FeedbackView: View {
//    @State private var showRateSheet = false
//    var body: some View {
//        Text("Feedback")
//            .onAppear {
//                showRateSheet = true
//            }
//            .sheet(isPresented: $showRateSheet) {
//                RateWeatherView()
//                    .presentationDetents([.fraction(0.4)]) // 40% height
//                    .presentationDragIndicator(.visible)
//            }
//    }
//}


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

