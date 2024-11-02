//
//  LoginView.swift
//  FoodApp
//
//  Created by Anıl on 2.11.2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authService: AuthService
    @State private var email = ""
    @State private var password = ""
    @State private var isLoading = false
    @State private var isShowingRegister = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
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
                        await authService.login(email: email, password: password)
                        isLoading = false
                    }
                }) {
                    if isLoading {
                        ProgressView()
                    } else {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .disabled(isLoading || email.isEmpty || password.isEmpty)
                
                Button("Create Account") {
                    isShowingRegister = true
                }
                .foregroundColor(.red)
                
                if let error = authService.error {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.caption)
                        .multilineTextAlignment(.center)
                }
            }
            .padding()
            .navigationTitle("Login")
            .sheet(isPresented: $isShowingRegister) {
                NavigationView {
                    RegisterView(isShowingRegister: $isShowingRegister)
                        .environmentObject(authService)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
