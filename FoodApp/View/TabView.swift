//
//  TabView.swift
//  FoodApp
//
//  Created by Anıl on 18.10.2024.
//

import SwiftUI

struct MainTabView: View {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 24, weight: .semibold)]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        let tabAppearance = UITabBarAppearance()
        tabAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 14)]
        tabAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 14)]
        
        UITabBar.appearance().standardAppearance = tabAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabAppearance
    }
    
    var body: some View {
        TabView {
            NavigationView {
                MenuView()
                    .navigationTitle("Menu")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Label("Menu", systemImage: "fork.knife.circle")
            }
            
            NavigationView {
                SoupsListView()
                    .navigationTitle("Food")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Label("Food", systemImage: "list.clipboard")
            }
        }
        .accentColor(.red)
    }
}

#Preview {
    MainTabView()
}
