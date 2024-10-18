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
                .frame(width: 80, height: 80)
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
                }
            }
            .padding(.horizontal)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 16) {
                    ForEach(foodList.items) { food in
                        NavigationLink(destination: FoodDetailView(recipe: Recipe.example)) {
                            FoodView(imageName: food.imageName, title: food.title, time: food.time)
                                .background(Color.white)
                                .cornerRadius(15)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding(.top, 20)
        .background(Color(UIColor.systemGray6).ignoresSafeArea())
    }
}


#Preview {
    FoodView(imageName: "circle", title: "Tomato Soup", time: "15-20 min")
}
