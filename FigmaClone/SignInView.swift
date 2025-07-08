//
//  SignInView.swift
//  FigmaClone
//
//  Created by Alkit Gupta on 05/07/25.
//

import SwiftUI

struct SignInView: View {
    @State private var email: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Spacer().frame(height: 40)

            // App name
            Text("App name")
                .font(.largeTitle)
                .fontWeight(.bold)

            // Headline and subheadline
            VStack(spacing: 4) {
                Text("Create an account")
                    .font(.title2)
                    .fontWeight(.semibold)

                Text("Enter your email to sign up for this app")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            // Email input field
            TextField("email@domain.com", text: $email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

            // Continue button
            Button(action: {
                // Handle continue action
            }) {
                Text("Continue")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
            }
            .padding(.horizontal)

            // OR separator
            HStack {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
                Text("or")
                    .foregroundColor(.gray)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)

            // Continue with Google
            Button(action: {
                // Handle Google sign-in
            }) {
                HStack {
                    Image(systemName: "globe") // Replace with Google logo if available
                    Text("Continue with Google")
                        .fontWeight(.medium)
                }
                .foregroundColor(.black)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }
            .padding(.horizontal)

            // Continue with Apple
            Button(action: {
                // Handle Apple sign-in
            }) {
                HStack {
                    Image(systemName: "applelogo")
                    Text("Continue with Apple")
                        .fontWeight(.medium)
                }
                .foregroundColor(.black)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }
            .padding(.horizontal)

            // Terms and Privacy
            Text("By clicking continue, you agree to our Terms of Service and Privacy Policy")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Spacer()
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
