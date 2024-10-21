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
        HStack(alignment: .top, spacing: 16) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
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
        .background(Color.white)
        .cornerRadius(15)
    }
}

struct SoupsListView: View {
    @ObservedObject var foodList = FoodList()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Soups")
                    .font(.title)
                    .bold()
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Text("View More")
                        .foregroundColor(.red)
                        .fontWeight(.bold)
                }
            }
            .padding(.horizontal)
            
            VStack(spacing: 0) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        let chunkedItems = foodList.items.chunked(into: 3)
                        
                        ForEach(chunkedItems, id: \.self) { group in
                            VStack(spacing: 16) {
                                ForEach(group) { food in
                                    NavigationLink(destination: FoodDetailView(recipe: Recipe.example)) {
                                        FoodView(imageName: food.imageName, title: food.title, time: food.time)
                                            .background(Color.white)
                                            .cornerRadius(15)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                        }
                    }
                    .padding(.leading, 8)
                }
            }
            .background(Color(UIColor.systemGray6).ignoresSafeArea())
            
            Spacer()
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
