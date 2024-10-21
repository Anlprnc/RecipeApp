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
    @Published var items: [Food] = [
        Food(imageName: "soup1", title: "Carrot and Sweet Potato Soup", time: "15-20 min"),
        Food(imageName: "soup2", title: "Tomato Soup", time: "20-25 min"),
        Food(imageName: "soup3", title: "Chicken Soup", time: "20-25 min"),
        Food(imageName: "soup1", title: "Carrot and Sweet Potato Soup", time: "15-20 min"),
        Food(imageName: "soup2", title: "Tomato Soup", time: "20-25 min"),
        Food(imageName: "soup3", title: "Chicken Soup", time: "20-25 min")
    ]
}
