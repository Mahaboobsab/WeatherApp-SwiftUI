//
//  ForecastCard.swift
//  FigmaClone
//
//  Created by Mahaboobsab Nadaf on 09/07/25.
//

import SwiftUI

struct ForecastCard: View {
    let hour: String
    let temp: String
    let imageUrl: String
    
    var body: some View {
        VStack(spacing: 6) {
            Text(hour)
                .font(.caption)
                .foregroundColor(.white)
            
            AsyncImage(url: URL(string: imageUrl)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 30, height: 30)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                case .failure:
                    Image(systemName: "exclamationmark.triangle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.red)
                @unknown default:
                    EmptyView()
                }
            }
            
            Text(temp)
                .font(.caption)
                .foregroundColor(.white)
        }
        .frame(width: 60)
    }
}


struct WeatherDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDashboardView()
    }
}
