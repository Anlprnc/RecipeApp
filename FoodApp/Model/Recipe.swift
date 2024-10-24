//
//  Recipe.swift
//  FoodApp
//
//  Created by Anıl on 24.10.2024.
//

import Foundation

enum RecipeType: String {
    case soup = "Soup"
    case salad = "Salad"
    case mainDishes = "Main Dishes"
    case Purees = "Purees"
}

struct RecipeStep: Identifiable, Hashable {
    var id = UUID()
    var stepNumber: Int
    var description: String
}

struct Recipe: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var image: String?
    var description: String
    var type: String
    var ingredients: [String]
    var steps: [RecipeStep]
    
    struct var example: Recipe {
        Recipe(title: "Tomato Soup", description: "A delicious tomato soup made with fresh ingredients.", type: "Soup", ingredients: ["Tomatoes", "Onion", "Garlic", "Basil"], steps: RecipeStep(stepNumber: 1, description: "Chop the vegetables."),
               RecipeStep(stepNumber: 2, description: "Cook the vegetables in a pot."),
               RecipeStep(stepNumber: 3, description: "Blend until smooth."),)
    }
}
