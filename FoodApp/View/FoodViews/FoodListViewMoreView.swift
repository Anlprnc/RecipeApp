//
//  FoodListViewMoreView.swift
//  FoodApp
//
//  Created by Anıl on 31.10.2024.
//

import SwiftUI

struct FoodListViewMoreView: View {
    @ObservedObject var foodList = FoodList()
    let imageName: String
    let title: String
    let time: String
    let category: Category
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                VStack(alignment: .leading) {
                    headerView(for: category)
                    horizontalScroll(for: category)
                }
                .padding(.vertical, 16)
                
                Spacer()
            }
            .background(Color(UIColor.systemGray6).ignoresSafeArea())
        }
    }
    
    private func headerView(for category: Category) -> some View {
        HStack {
            Text(category.title)
                .font(.title)
                .fontWeight(.medium)            
        }
        .padding(.horizontal)
    }
    
    private func horizontalScroll(for category: Category) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
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
        .padding(.horizontal, 20)
        .background(Color(UIColor.systemGray6).ignoresSafeArea())
    }
}

#Preview {
    let exampleRecipeSteps = [RecipeStep(id: UUID(), stepNumber: 1, description: "Chop vegetables.")]
    let exampleFood = Food(
        id: UUID(),
        imageName: "soup",
        title: "Tomato Soup",
        description: "A delicious tomato soup.",
        ingredients: ["Tomatoes", "Onion", "Garlic"],
        time: "15-20 min",
        type: .soup,
        steps: exampleRecipeSteps
    )
    let exampleCategory = Category(title: "Soups", items: [exampleFood])

    FoodListViewMoreView(imageName: "soup", title: "Soup", time: "15-20 min", category: exampleCategory)
}
