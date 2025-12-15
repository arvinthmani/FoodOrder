//
//  DetailsViewModel.swift
//  FoodOrder
//
//  Created by Arvinth Manivasakan on 02/06/25.
//

import Foundation
import SwiftUI

class DetailsViewModel: ObservableObject {
    
    private var apiService: ApiServices = ApiServices()
    
    @Published var meal = Meal(strMeal: "", strMealThumb: "", idMeal: "", strInstructions: "", strYoutube: "")
    @Published var isLoading = false
    
    private struct EmptyBody: Encodable {}
    
    @MainActor
    func getMealsDetail(id: String) async {
        do {
            isLoading = true
            defer { isLoading = false }
            let mealsList: MealsList = try await apiService.request(urlStr: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)", body: EmptyBody())
            if let first = mealsList.meals.first {
                meal = first
            }
        }
        catch {
            print(error.localizedDescription)
        }   
    }
    
}
