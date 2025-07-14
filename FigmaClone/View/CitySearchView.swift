//
//  CitySearchView.swift
//  FigmaClone
//
//  Created by Alkit Gupta on 14/07/25.
//

import SwiftUI

struct CitySearchView: View {
    @State private var cityName: String = ""
    
    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(
                gradient: Gradient(colors: [Color.purple, Color.blue]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            VStack() {
                HStack() {
                    TextField("Enter city name", text: $cityName)
                        .padding(10)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Button("Search", action: {
                        print("Search tapped!")
                        
                    })
                    .padding(10)
                    .background(Color.yellow)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }.padding()
                
                List {
                    SearchResultView(title: "New York", subtitle: "New York")
                        .listRowBackground(Color.white.opacity(0.2))
                    SearchResultView(title: "New Lenox", subtitle: "Illinois")
                        .listRowBackground(Color.white.opacity(0.2))
                    SearchResultView(title: "Oswego", subtitle: "Illinois")
                        .listRowBackground(Color.white.opacity(0.2))
                }
                .listRowBackground(Color.clear) // 🧼 Clears row backgrounds
                .scrollContentBackground(.hidden)
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

struct CitySearchView_Previews: PreviewProvider {
    static var previews: some View {
        CitySearchView()
    }
}

