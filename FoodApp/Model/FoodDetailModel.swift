//
//  FoodDetailModel.swift
//  FoodApp
//
//  Created by Anıl on 18.10.2024.
//

import Foundation

struct Recipe: Codable, Identifiable {
    let id: UUID
    let title: String
    let type: RecipeType
    let description: String
    let ingredients: [String]
    let steps: [RecipeStep]
    let image: String?
    
    init(id: UUID = UUID(), title: String, type: RecipeType, description: String, ingredients: [String], steps: [RecipeStep], image: String? = nil) {
        self.id = id
        self.title = title
        self.type = type
        self.description = description
        self.ingredients = ingredients
        self.steps = steps
        self.image = image
    }
}

enum RecipeType: String, Codable {
    case snack = "Snack"
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    case dessert = "Dessert"
}

struct RecipeStep: Codable, Identifiable {
    let id: UUID
    let stepNumber: Int
    let description: String
    
    init(id: UUID = UUID(), stepNumber: Int, description: String) {
        self.id = id
        self.stepNumber = stepNumber
        self.description = description
    }
}

extension Recipe {
    static let example = Recipe(
        title: "Mini Vegetable Muffins",
        type: .snack,
        description: "It's contributes to the healthy nutrition of babies. Vegetables are rich in vitamins and minerals, which helps strengthen the immune system of babies. At the same time, babies are also accustomed to different tastes with such foods.",
        ingredients: ["Carrot", "Zucchini", "Sweet Potato", "Spinach"],
        steps: [
            RecipeStep(stepNumber: 1, description: "Grate the carrot, zucchini, and sweet potato. Make sure to squeeze excess moisture from the zucchini.Chop the spinach finely and set the peas aside. If you are using frozen peas, defrost them."),
            RecipeStep(stepNumber: 2, description: "In a large mixing bowl, combine the whole wheat flour, oat flour, baking powder, and herbs (if using). Stir everything together."),
            RecipeStep(stepNumber: 3, description: "In a separate bowl, whisk together the egg, yogurt, olive oil (or melted butter), and milk."),
            RecipeStep(stepNumber: 4, description: "Gradually add the wet ingredients to the dry mixture. Stir gently until just combined.Fold in the grated vegetables, peas, spinach, and grated cheese. If the mixture seems too dry, add a bit more milk (a tablespoon at a time)."),
            RecipeStep(stepNumber: 5, description: "Preheat your oven to 350°F (180°C). Grease your muffin tin or line with paper liners.")
        ]
    )
}
