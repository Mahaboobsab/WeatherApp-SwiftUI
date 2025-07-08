//
//  ContentView.swift
//  FigmaClone
//
//  Created by Mahaboobsab Nada on 05/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Gradient
                LinearGradient(
                    gradient: Gradient(colors: [Color.purple, Color.blue]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    Spacer(minLength: 40)
                    
                    // Weather Icon (System image used as placeholder)
                    Image("Dashboard").resizable().frame(width: 228, height: 228, alignment: .top).ignoresSafeArea()
                    
                    
                    
                    // Title Text
                    VStack(spacing: 5) {
                        Text("Weather")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("Fore Casts")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.yellow)
                    }
                    
                    Spacer()
                    
                    // NavigationLink instead of Button
                                      NavigationLink(destination: WeatherDashboardView()) {
                                          Text("Get Start")
                                              .font(.headline)
                                              .foregroundColor(.blue)
                                              .padding(.horizontal, 50)
                                              .padding(.vertical, 12)
                                              .background(Color.yellow)
                                              .clipShape(Capsule())
                                      }
                    
                    Spacer(minLength: 40)
                }
                .padding()
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
