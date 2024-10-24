//
//  FoodListModel.swift
//  FoodApp
//
//  Created by Anıl on 18.10.2024.
//

import Foundation

struct Food: Identifiable, Hashable {
    var id = UUID()
    var imageName: String
    var title: String
    var time: String
}

class FoodList: ObservableObject {
    @Published var categories: [Category] = [
        Category(
            title: "Soups",
            items: [
                Food(imageName: "soup", title: "Carrot and Sweet Potato Soup", time: "15-20 min"),
                Food(imageName: "soup", title: "Tomato Soup", time: "20-25 min"),
                Food(imageName: "soup", title: "Chicken Soup", time: "20-25 min"),
                Food(imageName: "soup", title: "Carrot and Sweet Potato Soup", time: "15-20 min"),
                Food(imageName: "soup", title: "Tomato Soup", time: "20-25 min"),
                Food(imageName: "soup", title: "Chicken Soup", time: "20-25 min"),
            ]
        ),
        Category(
            title: "Salads",
            items: [
                Food(imageName: "soup", title: "Carrot and Sweet Potato Soup", time: "10-15 min"),
                Food(imageName: "soup", title: "Greek Salad", time: "10-15 min"),
                Food(imageName: "soup", title: "Caesar Salad", time: "10-15 min"),
                Food(imageName: "soup", title: "Greek Salad", time: "10-15 min"),
                Food(imageName: "soup", title: "Caesar Salad", time: "10-15 min"),
                Food(imageName: "soup", title: "Greek Salad", time: "10-15 min"),
            ]
        ),
        Category(
            title: "Salads",
            items: [
                Food(imageName: "soup", title: "Caesar Salad", time: "10-15 min"),
                Food(imageName: "soup", title: "Greek Salad", time: "10-15 min"),
                Food(imageName: "soup", title: "Caesar Salad", time: "10-15 min"),
                Food(imageName: "soup", title: "Greek Salad", time: "10-15 min"),
                Food(imageName: "soup", title: "Caesar Salad", time: "10-15 min"),
                Food(imageName: "soup", title: "Greek Salad", time: "10-15 min"),
            ]
        ),
    ]
}
