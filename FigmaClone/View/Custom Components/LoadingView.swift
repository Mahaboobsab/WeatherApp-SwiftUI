//
//  LoadingView.swift
//  GitHubDemo
//
//  Created by Alkit Gupta on 05/07/25.
//

import SwiftUI

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.6).ignoresSafeArea()
            ProgressView("Fetching ...")
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .foregroundColor(.white)
                .scaleEffect(1.5)
        }
    }
}
