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
    @StateObject private var foodList = FoodRecipeList()
    
    var body: some Scene {
        WindowGroup {
            Group {
                if authService.isAuthenticated {
                    ContentView()
                        .environmentObject(foodList)
                        .environmentObject(authService)
                } else {
                    LoginView()
                        .environmentObject(authService)
                }
            }
        }
    }
}
