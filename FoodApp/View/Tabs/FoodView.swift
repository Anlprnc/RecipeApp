//
//  FoodView.swift
//  FoodApp
//
//  Created by Anıl on 18.10.2024.
//

import SwiftUI

struct FoodView: View {
    let imageName: String
    let title: String
    let time: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 6) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 65, height: 65)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(10)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.title3)
                    .lineLimit(1)
                    .truncationMode(.tail)
                
                HStack(spacing: 12) {
                    Text("Soup")
                        .font(.subheadline)
                        .padding(.horizontal, 11)
                        .padding(.vertical, 1)
                        .background(Color.red.opacity(0.8))
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .cornerRadius(6)
                    
                    HStack(spacing: 4) {
                        Text(time)
                            .font(.subheadline)
                        
                        Image(systemName: "clock.arrow.trianglehead.2.counterclockwise.rotate.90")
                            .font(.caption)
                    }
                }
            }
            .padding(.vertical, 10)
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width * 0.90)
        .background(Color.white)
        .cornerRadius(15)
    }
}

struct SoupsListView: View {
    @ObservedObject var foodList = FoodRecipeList()
    @EnvironmentObject var authService: AuthService
    
    var body: some View {
            VStack(alignment: .leading) {
                ScrollView {
                    ForEach(foodList.categories) { category in
                        VStack(alignment: .leading) {
                            headerView(for: category)
                            horizontalScroll(for: category)
                        }
                        .padding(.vertical, 16)
                    }
                    Spacer()
                }
                .background(Color(UIColor.systemGray6).ignoresSafeArea())
            }
            .navigationBarItems(trailing: createButton)
            .onAppear {
                foodList.fetchFoods()
            }
        }
    
    private var createButton: some View {
        if let role = authService.currentUser?.role {
            if role == .MANAGER || role == .ADMIN {
                return AnyView(
                    NavigationLink(destination: CreateFoodView()) {
                        Text("Create Food")
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(.red)
                    }
                )
            }
        }
        return AnyView(EmptyView())
    }
    
    private func headerView(for category: Category) -> some View {
        HStack {
            Text(category.title)
                .font(.title)
                .fontWeight(.medium)
            
            Spacer()
            
            NavigationLink(destination: FoodListViewMoreView(imageName: category.items.first?.imageName ?? "soup", title: category.title, time: category.items.first?.time ?? "unknown", category: category)) {
                Text("View More")
                    .foregroundColor(.red)
                    .fontWeight(.bold)
            }
        }
        .padding(.horizontal)
    }
    
    private func horizontalScroll(for category: Category) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                let chunkedItems = category.items.chunked(into: 3)
                
                ForEach(chunkedItems, id: \.self) { group in
                    VStack(spacing: 8) {
                        ForEach(group) { food in
                            NavigationLink(destination: FoodDetailView(food: food)) {
                                FoodView(imageName: food.imageName, title: food.title, time: food.time)
                                    .background(Color.white)
                                    .cornerRadius(15)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            .padding(.leading, 12)
        }
        .background(Color(UIColor.systemGray6).ignoresSafeArea())
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}

#Preview {
    FoodView(imageName: "circle", title: "Tomato Soup", time: "15-20 min")
}
