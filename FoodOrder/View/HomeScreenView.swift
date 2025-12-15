//
//  ContentView.swift
//  FoodOrder
//
//  Created by Arvinth Manivasakan on 28/05/25.
//

import SwiftUI

struct HomeScreenView: View {
    
    @StateObject var vm: HomeScreenViewModel = HomeScreenViewModel()
    @State var selectedCategory: String = "Chicken"
    @State var mealsSelected: Bool = false
    
    var body: some View {
        VStack {
            CategoryScrollView(categories: $vm.allCategories.categories, selectedCategory: $selectedCategory)
                .onChange(of: selectedCategory) { newValue in
                    Task {
                        await vm.getMealsList(selectedCategory: newValue)
                    }
                }
            
            MealsListView(meals: $vm.allMeals.meals)
                .task {
                    await vm.getCategories()
                    await vm.getMealsList(selectedCategory: selectedCategory)
                }
            }
        .navigationTitle("🍟 Swiggytoo")
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    NavigationView {
        HomeScreenView()
    }
}
