//
//  FoodAppApp.swift
//  FoodApp
//
//  Created by Anıl on 18.10.2024.
//

import SwiftUI

@main
struct FoodAppApp: App {
    @StateObject private var authService = AuthService()
    
    var body: some Scene {
        WindowGroup {
            Group {
                if authService.isAuthenticated {
                    ContentView()
                        .environmentObject(authService)
                } else {
                    LoginView()
                        .environmentObject(authService)
                }
            }
        }
    }
}
