//
//  CategoryModel.swift
//  FoodApp
//
//  Created by Anıl on 24.10.2024.
//

import Foundation


struct Category: Identifiable {
    let id = UUID()
    let title: String
    let items: [Food]
}
