//
//  FoodListModel.swift
//  FoodApp
//
//  Created by Anıl on 18.10.2024.
//

import Foundation

struct Food: Codable, Identifiable, Hashable {
    var id = UUID()
    var imageName: String
    var title: String
    var description: String
    var ingredients: [String]
    var time: String
    var type: RecipeType
    let steps: [RecipeStep]
    
    static func == (lhs: Food, rhs: Food) -> Bool {
            lhs.id == rhs.id &&
            lhs.imageName == rhs.imageName &&
            lhs.title == rhs.title &&
            lhs.description == rhs.description &&
            lhs.ingredients == rhs.ingredients &&
            lhs.time == rhs.time &&
            lhs.type == rhs.type &&
            lhs.steps == rhs.steps
        }
}

struct RecipeStep: Codable, Identifiable, Equatable, Hashable {
    let id: UUID
    let stepNumber: Int
    let description: String
    
    init(id: UUID = UUID(), stepNumber: Int, description: String) {
        self.id = id
        self.stepNumber = stepNumber
        self.description = description
    }
}

enum RecipeType: String, Codable {
    case soup = "Soup"
    case salad = "Salad"
    case purees = "Purees"
    case mainDishes = "Main Dishes"
    case snack = "Snack"
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    case dessert = "Dessert"
}

class FoodList: ObservableObject {
    @Published var categories: [Category] = [
        Category(
            title: "Soups",
            items: [
                Food(imageName: "soup", title: "Carrot and Sweet Potato Soup", description: "It's contributes to the healthy nutrition of babies. Vegetables are rich in vitamins and minerals, which helps strengthen the immune system of babies. At the same time, babies are also accustomed to different tastes with such foods.", ingredients: ["Carrot", "Zucchini", "Sweet Potato", "Spinach"], time: "15-20 min", type: .soup, steps: [
                    RecipeStep(stepNumber: 1, description: "Grate the carrot, zucchini, and sweet potato. Make sure to squeeze excess moisture from the zucchini.Chop the spinach finely and set the peas aside. If you are using frozen peas, defrost them."),
                    RecipeStep(stepNumber: 2, description: "In a large mixing bowl, combine the whole wheat flour, oat flour, baking powder, and herbs (if using). Stir everything together."),
                    RecipeStep(stepNumber: 3, description: "In a separate bowl, whisk together the egg, yogurt, olive oil (or melted butter), and milk."),
                    RecipeStep(stepNumber: 4, description: "Gradually add the wet ingredients to the dry mixture. Stir gently until just combined.Fold in the grated vegetables, peas, spinach, and grated cheese. If the mixture seems too dry, add a bit more milk (a tablespoon at a time)."),
                    RecipeStep(stepNumber: 5, description: "Preheat your oven to 350°F (180°C). Grease your muffin tin or line with paper liners.")
                ]),
                Food(imageName: "soup", title: "Carrot and Sweet Potato Soup", description: "It's contributes to the healthy nutrition of babies. Vegetables are rich in vitamins and minerals, which helps strengthen the immune system of babies. At the same time, babies are also accustomed to different tastes with such foods.", ingredients: ["Carrot", "Zucchini", "Sweet Potato", "Spinach"], time: "15-20 min", type: .soup, steps: [
                    RecipeStep(stepNumber: 1, description: "Grate the carrot, zucchini, and sweet potato. Make sure to squeeze excess moisture from the zucchini.Chop the spinach finely and set the peas aside. If you are using frozen peas, defrost them."),
                    RecipeStep(stepNumber: 2, description: "In a large mixing bowl, combine the whole wheat flour, oat flour, baking powder, and herbs (if using). Stir everything together."),
                    RecipeStep(stepNumber: 3, description: "In a separate bowl, whisk together the egg, yogurt, olive oil (or melted butter), and milk."),
                    RecipeStep(stepNumber: 4, description: "Gradually add the wet ingredients to the dry mixture. Stir gently until just combined.Fold in the grated vegetables, peas, spinach, and grated cheese. If the mixture seems too dry, add a bit more milk (a tablespoon at a time)."),
                    RecipeStep(stepNumber: 5, description: "Preheat your oven to 350°F (180°C). Grease your muffin tin or line with paper liners.")
                ]),
                Food(imageName: "soup", title: "Carrot and Sweet Potato Soup", description: "It's contributes to the healthy nutrition of babies. Vegetables are rich in vitamins and minerals, which helps strengthen the immune system of babies. At the same time, babies are also accustomed to different tastes with such foods.", ingredients: ["Carrot", "Zucchini", "Sweet Potato", "Spinach"], time: "15-20 min", type: .soup, steps: [
                    RecipeStep(stepNumber: 1, description: "Grate the carrot, zucchini, and sweet potato. Make sure to squeeze excess moisture from the zucchini.Chop the spinach finely and set the peas aside. If you are using frozen peas, defrost them."),
                    RecipeStep(stepNumber: 2, description: "In a large mixing bowl, combine the whole wheat flour, oat flour, baking powder, and herbs (if using). Stir everything together."),
                    RecipeStep(stepNumber: 3, description: "In a separate bowl, whisk together the egg, yogurt, olive oil (or melted butter), and milk."),
                    RecipeStep(stepNumber: 4, description: "Gradually add the wet ingredients to the dry mixture. Stir gently until just combined.Fold in the grated vegetables, peas, spinach, and grated cheese. If the mixture seems too dry, add a bit more milk (a tablespoon at a time)."),
                    RecipeStep(stepNumber: 5, description: "Preheat your oven to 350°F (180°C). Grease your muffin tin or line with paper liners.")
                ]),
                Food(imageName: "soup", title: "Carrot and Sweet Potato Soup", description: "It's contributes to the healthy nutrition of babies. Vegetables are rich in vitamins and minerals, which helps strengthen the immune system of babies. At the same time, babies are also accustomed to different tastes with such foods.", ingredients: ["Carrot", "Zucchini", "Sweet Potato", "Spinach"], time: "15-20 min", type: .soup, steps: [
                    RecipeStep(stepNumber: 1, description: "Grate the carrot, zucchini, and sweet potato. Make sure to squeeze excess moisture from the zucchini.Chop the spinach finely and set the peas aside. If you are using frozen peas, defrost them."),
                    RecipeStep(stepNumber: 2, description: "In a large mixing bowl, combine the whole wheat flour, oat flour, baking powder, and herbs (if using). Stir everything together."),
                    RecipeStep(stepNumber: 3, description: "In a separate bowl, whisk together the egg, yogurt, olive oil (or melted butter), and milk."),
                    RecipeStep(stepNumber: 4, description: "Gradually add the wet ingredients to the dry mixture. Stir gently until just combined.Fold in the grated vegetables, peas, spinach, and grated cheese. If the mixture seems too dry, add a bit more milk (a tablespoon at a time)."),
                    RecipeStep(stepNumber: 5, description: "Preheat your oven to 350°F (180°C). Grease your muffin tin or line with paper liners.")
                ]),
                Food(imageName: "soup", title: "Carrot and Sweet Potato Soup", description: "It's contributes to the healthy nutrition of babies. Vegetables are rich in vitamins and minerals, which helps strengthen the immune system of babies. At the same time, babies are also accustomed to different tastes with such foods.", ingredients: ["Carrot", "Zucchini", "Sweet Potato", "Spinach"], time: "15-20 min", type: .soup, steps: [
                    RecipeStep(stepNumber: 1, description: "Grate the carrot, zucchini, and sweet potato. Make sure to squeeze excess moisture from the zucchini.Chop the spinach finely and set the peas aside. If you are using frozen peas, defrost them."),
                    RecipeStep(stepNumber: 2, description: "In a large mixing bowl, combine the whole wheat flour, oat flour, baking powder, and herbs (if using). Stir everything together."),
                    RecipeStep(stepNumber: 3, description: "In a separate bowl, whisk together the egg, yogurt, olive oil (or melted butter), and milk."),
                    RecipeStep(stepNumber: 4, description: "Gradually add the wet ingredients to the dry mixture. Stir gently until just combined.Fold in the grated vegetables, peas, spinach, and grated cheese. If the mixture seems too dry, add a bit more milk (a tablespoon at a time)."),
                    RecipeStep(stepNumber: 5, description: "Preheat your oven to 350°F (180°C). Grease your muffin tin or line with paper liners.")
                ]),
                Food(imageName: "soup", title: "Carrot and Sweet Potato Soup", description: "It's contributes to the healthy nutrition of babies. Vegetables are rich in vitamins and minerals, which helps strengthen the immune system of babies. At the same time, babies are also accustomed to different tastes with such foods.", ingredients: ["Carrot", "Zucchini", "Sweet Potato", "Spinach"], time: "15-20 min", type: .soup, steps: [
                    RecipeStep(stepNumber: 1, description: "Grate the carrot, zucchini, and sweet potato. Make sure to squeeze excess moisture from the zucchini.Chop the spinach finely and set the peas aside. If you are using frozen peas, defrost them."),
                    RecipeStep(stepNumber: 2, description: "In a large mixing bowl, combine the whole wheat flour, oat flour, baking powder, and herbs (if using). Stir everything together."),
                    RecipeStep(stepNumber: 3, description: "In a separate bowl, whisk together the egg, yogurt, olive oil (or melted butter), and milk."),
                    RecipeStep(stepNumber: 4, description: "Gradually add the wet ingredients to the dry mixture. Stir gently until just combined.Fold in the grated vegetables, peas, spinach, and grated cheese. If the mixture seems too dry, add a bit more milk (a tablespoon at a time)."),
                    RecipeStep(stepNumber: 5, description: "Preheat your oven to 350°F (180°C). Grease your muffin tin or line with paper liners.")
                ]),
            ]
        ),
        Category(
            title: "Salads",
            items: [
                Food(imageName: "soup", title: "Carrot and Sweet Potato Soup", description: "It's contributes to the healthy nutrition of babies. Vegetables are rich in vitamins and minerals, which helps strengthen the immune system of babies. At the same time, babies are also accustomed to different tastes with such foods.", ingredients: ["Carrot", "Zucchini", "Sweet Potato", "Spinach"], time: "10-15 min", type: .salad, steps: [
                    RecipeStep(stepNumber: 1, description: "Grate the carrot, zucchini, and sweet potato. Make sure to squeeze excess moisture from the zucchini.Chop the spinach finely and set the peas aside. If you are using frozen peas, defrost them."),
                    RecipeStep(stepNumber: 2, description: "In a large mixing bowl, combine the whole wheat flour, oat flour, baking powder, and herbs (if using). Stir everything together."),
                    RecipeStep(stepNumber: 3, description: "In a separate bowl, whisk together the egg, yogurt, olive oil (or melted butter), and milk.")
                ]),
                Food(imageName: "soup", title: "Carrot and Sweet Potato Soup", description: "It's contributes to the healthy nutrition of babies. Vegetables are rich in vitamins and minerals, which helps strengthen the immune system of babies. At the same time, babies are also accustomed to different tastes with such foods.", ingredients: ["Carrot", "Zucchini", "Sweet Potato", "Spinach"], time: "10-15 min", type: .salad, steps: [
                    RecipeStep(stepNumber: 1, description: "Grate the carrot, zucchini, and sweet potato. Make sure to squeeze excess moisture from the zucchini.Chop the spinach finely and set the peas aside. If you are using frozen peas, defrost them."),
                    RecipeStep(stepNumber: 2, description: "In a large mixing bowl, combine the whole wheat flour, oat flour, baking powder, and herbs (if using). Stir everything together."),
                    RecipeStep(stepNumber: 3, description: "In a separate bowl, whisk together the egg, yogurt, olive oil (or melted butter), and milk.")
                ]),
                Food(imageName: "soup", title: "Carrot and Sweet Potato Soup", description: "It's contributes to the healthy nutrition of babies. Vegetables are rich in vitamins and minerals, which helps strengthen the immune system of babies. At the same time, babies are also accustomed to different tastes with such foods.", ingredients: ["Carrot", "Zucchini", "Sweet Potato", "Spinach"], time: "10-15 min", type: .salad, steps: [
                    RecipeStep(stepNumber: 1, description: "Grate the carrot, zucchini, and sweet potato. Make sure to squeeze excess moisture from the zucchini.Chop the spinach finely and set the peas aside. If you are using frozen peas, defrost them."),
                    RecipeStep(stepNumber: 2, description: "In a large mixing bowl, combine the whole wheat flour, oat flour, baking powder, and herbs (if using). Stir everything together."),
                    RecipeStep(stepNumber: 3, description: "In a separate bowl, whisk together the egg, yogurt, olive oil (or melted butter), and milk.")
                ]),
                Food(imageName: "soup", title: "Carrot and Sweet Potato Soup", description: "It's contributes to the healthy nutrition of babies. Vegetables are rich in vitamins and minerals, which helps strengthen the immune system of babies. At the same time, babies are also accustomed to different tastes with such foods.", ingredients: ["Carrot", "Zucchini", "Sweet Potato", "Spinach"], time: "10-15 min", type: .salad, steps: [
                    RecipeStep(stepNumber: 1, description: "Grate the carrot, zucchini, and sweet potato. Make sure to squeeze excess moisture from the zucchini.Chop the spinach finely and set the peas aside. If you are using frozen peas, defrost them."),
                    RecipeStep(stepNumber: 2, description: "In a large mixing bowl, combine the whole wheat flour, oat flour, baking powder, and herbs (if using). Stir everything together."),
                    RecipeStep(stepNumber: 3, description: "In a separate bowl, whisk together the egg, yogurt, olive oil (or melted butter), and milk.")
                ]),
                Food(imageName: "soup", title: "Carrot and Sweet Potato Soup", description: "It's contributes to the healthy nutrition of babies. Vegetables are rich in vitamins and minerals, which helps strengthen the immune system of babies. At the same time, babies are also accustomed to different tastes with such foods.", ingredients: ["Carrot", "Zucchini", "Sweet Potato", "Spinach"], time: "10-15 min", type: .salad, steps: [
                    RecipeStep(stepNumber: 1, description: "Grate the carrot, zucchini, and sweet potato. Make sure to squeeze excess moisture from the zucchini.Chop the spinach finely and set the peas aside. If you are using frozen peas, defrost them."),
                    RecipeStep(stepNumber: 2, description: "In a large mixing bowl, combine the whole wheat flour, oat flour, baking powder, and herbs (if using). Stir everything together."),
                    RecipeStep(stepNumber: 3, description: "In a separate bowl, whisk together the egg, yogurt, olive oil (or melted butter), and milk.")
                ]),
                Food(imageName: "soup", title: "Carrot and Sweet Potato Soup", description: "It's contributes to the healthy nutrition of babies. Vegetables are rich in vitamins and minerals, which helps strengthen the immune system of babies. At the same time, babies are also accustomed to different tastes with such foods.", ingredients: ["Carrot", "Zucchini", "Sweet Potato", "Spinach"], time: "10-15 min", type: .salad, steps: [
                    RecipeStep(stepNumber: 1, description: "Grate the carrot, zucchini, and sweet potato. Make sure to squeeze excess moisture from the zucchini.Chop the spinach finely and set the peas aside. If you are using frozen peas, defrost them."),
                    RecipeStep(stepNumber: 2, description: "In a large mixing bowl, combine the whole wheat flour, oat flour, baking powder, and herbs (if using). Stir everything together."),
                    RecipeStep(stepNumber: 3, description: "In a separate bowl, whisk together the egg, yogurt, olive oil (or melted butter), and milk.")
                ]),
            ]
        ),
        Category(
            title: "Salads",
            items: [
                Food(imageName: "soup", title: "Caesar Salad", description: "It's contributes to the healthy nutrition of babies. Vegetables are rich in vitamins and minerals, which helps strengthen the immune system of babies. At the same time, babies are also accustomed to different tastes with such foods.", ingredients: ["Carrot", "Zucchini", "Sweet Potato", "Spinach"], time: "10-15 min", type: .salad, steps: [
                    RecipeStep(stepNumber: 1, description: "Grate the carrot, zucchini, and sweet potato. Make sure to squeeze excess moisture from the zucchini.Chop the spinach finely and set the peas aside. If you are using frozen peas, defrost them."),
                    RecipeStep(stepNumber: 2, description: "In a large mixing bowl, combine the whole wheat flour, oat flour, baking powder, and herbs (if using). Stir everything together."),
                    RecipeStep(stepNumber: 3, description: "In a separate bowl, whisk together the egg, yogurt, olive oil (or melted butter), and milk.")
                ]),
                Food(imageName: "soup", title: "Caesar Salad", description: "It's contributes to the healthy nutrition of babies. Vegetables are rich in vitamins and minerals, which helps strengthen the immune system of babies. At the same time, babies are also accustomed to different tastes with such foods.", ingredients: ["Carrot", "Zucchini", "Sweet Potato", "Spinach"], time: "10-15 min", type: .salad, steps: [
                    RecipeStep(stepNumber: 1, description: "Grate the carrot, zucchini, and sweet potato. Make sure to squeeze excess moisture from the zucchini.Chop the spinach finely and set the peas aside. If you are using frozen peas, defrost them."),
                    RecipeStep(stepNumber: 2, description: "In a large mixing bowl, combine the whole wheat flour, oat flour, baking powder, and herbs (if using). Stir everything together."),
                    RecipeStep(stepNumber: 3, description: "In a separate bowl, whisk together the egg, yogurt, olive oil (or melted butter), and milk.")
                ]),
                Food(imageName: "soup", title: "Caesar Salad", description: "It's contributes to the healthy nutrition of babies. Vegetables are rich in vitamins and minerals, which helps strengthen the immune system of babies. At the same time, babies are also accustomed to different tastes with such foods.", ingredients: ["Carrot", "Zucchini", "Sweet Potato", "Spinach"], time: "10-15 min", type: .salad, steps: [
                    RecipeStep(stepNumber: 1, description: "Grate the carrot, zucchini, and sweet potato. Make sure to squeeze excess moisture from the zucchini.Chop the spinach finely and set the peas aside. If you are using frozen peas, defrost them."),
                    RecipeStep(stepNumber: 2, description: "In a large mixing bowl, combine the whole wheat flour, oat flour, baking powder, and herbs (if using). Stir everything together."),
                    RecipeStep(stepNumber: 3, description: "In a separate bowl, whisk together the egg, yogurt, olive oil (or melted butter), and milk.")
                ]),
                Food(imageName: "soup", title: "Caesar Salad", description: "It's contributes to the healthy nutrition of babies. Vegetables are rich in vitamins and minerals, which helps strengthen the immune system of babies. At the same time, babies are also accustomed to different tastes with such foods.", ingredients: ["Carrot", "Zucchini", "Sweet Potato", "Spinach"], time: "10-15 min", type: .salad, steps: [
                    RecipeStep(stepNumber: 1, description: "Grate the carrot, zucchini, and sweet potato. Make sure to squeeze excess moisture from the zucchini.Chop the spinach finely and set the peas aside. If you are using frozen peas, defrost them."),
                    RecipeStep(stepNumber: 2, description: "In a large mixing bowl, combine the whole wheat flour, oat flour, baking powder, and herbs (if using). Stir everything together."),
                    RecipeStep(stepNumber: 3, description: "In a separate bowl, whisk together the egg, yogurt, olive oil (or melted butter), and milk.")
                ]),
                Food(imageName: "soup", title: "Caesar Salad", description: "It's contributes to the healthy nutrition of babies. Vegetables are rich in vitamins and minerals, which helps strengthen the immune system of babies. At the same time, babies are also accustomed to different tastes with such foods.", ingredients: ["Carrot", "Zucchini", "Sweet Potato", "Spinach"], time: "10-15 min", type: .salad, steps: [
                    RecipeStep(stepNumber: 1, description: "Grate the carrot, zucchini, and sweet potato. Make sure to squeeze excess moisture from the zucchini.Chop the spinach finely and set the peas aside. If you are using frozen peas, defrost them."),
                    RecipeStep(stepNumber: 2, description: "In a large mixing bowl, combine the whole wheat flour, oat flour, baking powder, and herbs (if using). Stir everything together."),
                    RecipeStep(stepNumber: 3, description: "In a separate bowl, whisk together the egg, yogurt, olive oil (or melted butter), and milk.")
                ]),
                Food(imageName: "soup", title: "Caesar Salad", description: "It's contributes to the healthy nutrition of babies. Vegetables are rich in vitamins and minerals, which helps strengthen the immune system of babies. At the same time, babies are also accustomed to different tastes with such foods.", ingredients: ["Carrot", "Zucchini", "Sweet Potato", "Spinach"], time: "10-15 min", type: .salad, steps: [
                    RecipeStep(stepNumber: 1, description: "Grate the carrot, zucchini, and sweet potato. Make sure to squeeze excess moisture from the zucchini.Chop the spinach finely and set the peas aside. If you are using frozen peas, defrost them."),
                    RecipeStep(stepNumber: 2, description: "In a large mixing bowl, combine the whole wheat flour, oat flour, baking powder, and herbs (if using). Stir everything together."),
                    RecipeStep(stepNumber: 3, description: "In a separate bowl, whisk together the egg, yogurt, olive oil (or melted butter), and milk.")
                ]),
            ]
        ),
    ]
}
