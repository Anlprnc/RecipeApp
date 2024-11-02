//
//  RegisterView.swift
//  FoodApp
//
//  Created by Anıl on 2.11.2024.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var authService: AuthService
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var isLoading = false
    @Environment(\.dismiss) var dismiss
    @Binding var isShowingRegister: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Full Name", text: $fullName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                Task {
                    isLoading = true
                    await authService.register(fullName: fullName, email: email, password: password)
                    isLoading = false
                    
                    if authService.isAuthenticated {
                        isShowingRegister = false
                    }
                }
            }) {
                if isLoading {
                    ProgressView()
                } else {
                    Text("Register")
                        .frame(maxWidth: .infinity)
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            .disabled(isLoading)
            
            if let error = authService.error {
                Text(error)
                    .foregroundColor(.red)
                    .font(.caption)
            }
        }
        .padding()
        .navigationTitle("Register")
    }
}

#Preview {
    RegisterView(isShowingRegister: .constant(true))
}
