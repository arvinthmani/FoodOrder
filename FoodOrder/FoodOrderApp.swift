//
//  FoodOrderApp.swift
//  FoodOrder
//
//  Created by Arvinth Manivasakan on 28/05/25.
//

import SwiftUI

@main
struct FoodOrderApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeScreenView()
                    .environment(\.apiServices, ApiServices())
            }
        }
    }
}
