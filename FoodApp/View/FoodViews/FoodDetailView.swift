//
//  FoodDetailView.swift
//  FoodApp
//
//  Created by Anıl on 18.10.2024.
//

import SwiftUI

struct FoodDetailView: View {
    let food: Food
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(food.imageName)
                    .resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .padding(5)
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text(food.title)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        TypeBadge(type: food.type)
                    }
                    .padding(.horizontal)
                    
                    Text(food.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "carrot.fill")
                                .font(.headline)
                                .foregroundStyle(Color.orange)
                            
                            Text("Ingredients")
                        }
                        .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(food.ingredients, id: \.self) { ingredient in
                                    IngredientBadge(name: ingredient)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.vertical, 10)
                    .background(Color.red.opacity(0.1))
                    
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Image(systemName: "frying.pan.fill")
                            
                            Text("Recipe")
                        }
                        .padding(.horizontal)
                        
                        ForEach(food.steps) { step in
                            StepView(stepNumber: step.stepNumber, description: step.description)
                        }
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TypeBadge: View {
    let type: RecipeType
    
    var body: some View {
        Text(type.rawValue)
            .font(.caption)
            .fontWeight(.medium)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color.pink.opacity(0.1))
            .foregroundColor(.pink)
            .cornerRadius(20)
    }
}

struct IngredientBadge: View {
    let name: String
    
    var body: some View {
        Text(name)
            .font(.subheadline)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(20)
    }
}

struct StepView: View {
    let stepNumber: Int
    let description: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Circle()
                .fill(Color.red)
                .frame(width: 8, height: 8)
                .padding(.top, 8)
            
            VStack(alignment: .leading) {
                Text("Step \(stepNumber)")
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
        }
        .padding(.horizontal)
        
        VStack {
            Text(description)
                .padding(10)
                .font(.subheadline)
                .fontWeight(.medium)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}

#Preview {
    NavigationView {
        FoodDetailView(food: Food(
            imageName: "soup",
            title: "Carrot and Sweet Potato Soup",
            description: "It's contributes to the healthy nutrition of babies. Vegetables are rich in vitamins and minerals, which helps strengthen the immune system of babies. At the same time, babies are also accustomed to different tastes with such foods.",
            ingredients: ["Carrot", "Zucchini", "Sweet Potato", "Spinach"],
            time: "15-20 min",
            type: .soup,
            steps: [
                RecipeStep(stepNumber: 1, description: "Grate the carrot, zucchini, and sweet potato. Make sure to squeeze excess moisture from the zucchini.Chop the spinach finely and set the peas aside. If you are using frozen peas, defrost them."),
                RecipeStep(stepNumber: 2, description: "In a large mixing bowl, combine the whole wheat flour, oat flour, baking powder, and herbs (if using). Stir everything together."),
                RecipeStep(stepNumber: 3, description: "In a separate bowl, whisk together the egg, yogurt, olive oil (or melted butter), and milk."),
                RecipeStep(stepNumber: 4, description: "Gradually add the wet ingredients to the dry mixture. Stir gently until just combined.Fold in the grated vegetables, peas, spinach, and grated cheese. If the mixture seems too dry, add a bit more milk (a tablespoon at a time)."),
                RecipeStep(stepNumber: 5, description: "Preheat your oven to 350°F (180°C). Grease your muffin tin or line with paper liners.")
            ]
        ))
    }
}
