//
//  MealsListView.swift
//  FoodOrder
//
//  Created by Arvinth Manivasakan on 29/05/25.
//

import SwiftUI

struct MealsListView: View {
    
    @Binding var meals: [Meal]
    
    private let gridColumns = [GridItem(.flexible(), spacing: 6), GridItem(.flexible(), spacing: 6)]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridColumns, spacing: 16) {
                ForEach(meals) { meal in
                    NavigationLink(destination: {
                        MealDetailsView(mealId: meal.id)
                    }, label: {
                        VStack {
                            AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 150, alignment: .top)
                                    .frame(maxWidth: .infinity)
                                    .clipped()
                            } placeholder: {
                                Image("placeHolder")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 150)
                                    .frame(maxWidth: .infinity)
                                    .clipped()
                            }
                            
                            Text(meal.strMeal)
                                .font(.system(size: 16, design: .rounded))
                                .lineLimit(2)
                                .foregroundColor(.primary)
                                .multilineTextAlignment(.leading)
                            
                            BasketButton(count: 0, incrementAction: {
                                
                            }, decrementAction: {
                                
                            })
                                .padding(4)
                        }
                        .background(Color.red.opacity(0.1))
                        .cornerRadius(10)
                    })
                }
            }
            .padding(.horizontal, 6)
        }
    }
}


#Preview {
    MealsListView(meals: .constant([Meal(strMeal: "Baked salmon with fennel & tomatoes", strMealThumb: "https://www.themealdb.com/images/media/meals/1548772327.jpg", idMeal: "52959", strInstructions: "", strYoutube: "")]))
}
