//
//  Categories.swift
//  FoodOrder
//
//  Created by Arvinth Manivasakan on 28/05/25.
//

import Foundation

struct CategoriesList: Decodable {
    var categories: [Category]
}

struct Category: Decodable, Identifiable {
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String

    var id: String { idCategory }
}

struct MealsList: Decodable {
    var meals: [Meal]
}

struct Meal: Decodable, Identifiable, Hashable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
    var strInstructions: String?
    var strYoutube: String?
    var strCategory: String?
    var strArea: String?
    var strTags: String?
    
    var id: String { idMeal }
    
    var  uTubeId: String? {
        guard let strYoutube, !strYoutube.isEmpty else { return nil }
        guard let url = URLComponents(string: strYoutube),
              url.host?.contains("youtube.com") == true,
              let qItems = url.queryItems else {
            return nil
        }
        
        return qItems.first(where: { $0.name == "v" })?.value
    }
}

