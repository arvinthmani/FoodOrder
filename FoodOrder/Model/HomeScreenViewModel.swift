//
//  HomeScreenViewModel 2.swift
//  FoodOrder
//
//  Created by Arvinth Manivasakan on 02/06/25.
//

import Foundation

class HomeScreenViewModel: ObservableObject {
    
    private struct EmptyBody: Encodable {}

    private var apiService: ApiServices = ApiServices()
    
    @Published var allCategories: CategoriesList = CategoriesList(categories: [])
    
    @Published var allMeals: MealsList = MealsList(meals: [])
    
    @MainActor
    func getCategories() async {
        do {
            let categories: CategoriesList = try await apiService.request(urlStr: "https://www.themealdb.com/api/json/v1/1/categories.php", body: EmptyBody())
            self.allCategories = categories
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    @MainActor
    func getMealsList(selectedCategory: String) async {
        do {
            let meals: MealsList = try await apiService.request(urlStr: "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(selectedCategory)", body: EmptyBody())
            self.allMeals = meals
        }
        catch {
            print(error.localizedDescription)
        }
    }
}

