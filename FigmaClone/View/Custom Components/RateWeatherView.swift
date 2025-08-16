//
//  RateWeatherView.swift
//  FigmaClone
//
//  Created by Alkit Gupta on 15/08/25.
//

import SwiftUI

struct RateWeatherView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedRating: Int? = nil
    
    let emojis = ["😭", "☹️", "😐", "😊", "😄"]
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Heart Icon
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 60, height: 60)
                    .shadow(radius: 3)
                
                Image(systemName: "heart.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.red)
            }
            .offset(y: 10) // Moves the entire ZStack up visually

            
            // Title
            Text("Rate Weather")
                .font(.title2)
                .fontWeight(.semibold)
            
            // Subtitle
            Text("How do you feel about Weather?")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            // Emojis
            HStack(spacing: 20) {
                ForEach(emojis.indices, id: \.self) { index in
                    Text(emojis[index])
                        .font(.system(size: 34))
                        .padding(8)
                        .background(selectedRating == index ? Color.gray.opacity(0.2) : Color.clear)
                        .clipShape(Circle())
                        .onTapGesture {
                            selectedRating = index
                        }
                }
            }
            
            Divider()
                .padding(.top, 10)
            
            // Buttons
            HStack {
                Button("Later") {
                    dismiss()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(.gray)
                
                Button("Rate now") {
                    print("User selected rating: \(selectedRating ?? -1)")
                    if let url = URL(string: "https://apps.apple.com/us/app/weather/id1069513131") {
                        UIApplication.shared.open(url)
                    }
                    dismiss()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(.blue)
            }
        }
        .padding(.horizontal)
        .background(Color(.systemBackground))
        .cornerRadius(20)
    }
}
