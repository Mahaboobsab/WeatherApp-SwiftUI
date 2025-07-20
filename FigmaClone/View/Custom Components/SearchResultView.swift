//
//  SearchResultView.swift
//  FigmaClone
//
//  Created by Alkit Gupta on 15/07/25.
//

import SwiftUI

struct SearchResultView: View {
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.yellow)
        }
        .padding(.vertical, 8)
        .background(Color.clear)
        
    }
        
}
