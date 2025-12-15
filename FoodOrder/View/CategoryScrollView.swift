//
//  CategoryScrollView.swift
//  FoodOrder
//
//  Created by Arvinth Manivasakan on 28/05/25.
//

import SwiftUI

struct CategoryScrollView: View {
    
    @Binding var categories: [Category]
    @Binding var selectedCategory: String

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 5) {
                ForEach(categories) { category in
                    VStack {
                        AsyncImage(url: URL(string: category.strCategoryThumb)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 50)
                        } placeholder: {
                            Image("placeHolder")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 50)
                        }
                        
                        Text(category.strCategory)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                    }
                    .frame(width: 100, height: 80, alignment: .top)
                    .padding(4)
                    .overlay(alignment: .bottom, content: {
                        if selectedCategory == category.strCategory {
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(Color.green.opacity(0.5))
                        }
                    })
                    .cornerRadius(selectedCategory == category.strCategory ? 3 : 0)
                    .onTapGesture {
                        withAnimation(.linear(duration: 0.5)) {
                            selectedCategory = category.strCategory
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
        .frame(height: 100)
    }
}

#Preview {
    CategoryScrollView(categories: .constant([Category(idCategory: "Beef", strCategory: "Beef", strCategoryThumb: "https://www.themealdb.com/images/category/beef.png", strCategoryDescription: "")]), selectedCategory: .constant("Beef"))
}
