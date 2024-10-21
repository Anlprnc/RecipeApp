//
//  FoodDetailView.swift
//  FoodApp
//
//  Created by Anıl on 18.10.2024.
//

import SwiftUI

struct FoodDetailView: View {
    let recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let imageUrl = recipe.image {
                    AsyncImage(url: URL(string: imageUrl)) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 200)
                                .clipped()
                        default:
                            Rectangle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(height: 200)
                        }
                    }
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text(recipe.title)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        TypeBadge(type: recipe.type)
                    }
                    .padding(.horizontal)
                    
                    Text(recipe.description)
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
                                ForEach(recipe.ingredients, id: \.self) { ingredient in
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
                        
                        ForEach(recipe.steps) { step in
                            StepView(step: step)
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
    let step: RecipeStep
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Circle()
                .fill(Color.red)
                .frame(width: 8, height: 8)
                .padding(.top, 8)
            
            VStack(alignment: .leading) {
                Text("Step \(step.stepNumber)")
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
        }
        .padding(.horizontal)
        
        VStack {
            Text(step.description)
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
        FoodDetailView(recipe: Recipe.example)
    }
}
