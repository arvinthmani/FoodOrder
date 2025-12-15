//
//  MealDetailsView.swift
//  FoodOrder
//
//  Created by Arvinth Manivasakan on 29/05/25.
//

import SwiftUI

class Demo<T> {
    
    var val: T
    
    init(val: T) {
        self.val = val
    }
}

struct MealDetailsView: View {

    var mealId: String
    @Environment(\.dismiss) var dismiss
    
    @StateObject var vm = DetailsViewModel()
    
    var body: some View {
        VStack {
            if vm.isLoading {
                ProgressView()
            } else {
                VStack {
                    ScrollView {
                        VStack {
                            ZStack(alignment: .topLeading) {
                                AsyncImage(url: URL(string: vm.meal.strMealThumb), content: { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: UIScreen.main.bounds.width, height: 250)
                                        .clipped()
                                }, placeholder: {
                                    Image("placeHolder")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: UIScreen.main.bounds.width, height: 250)
                                        .clipped()
                                })
                                
                                VStack {
                                    Spacer()
                                    
                                    HStack(spacing: 10) {
                                        Group {
                                            if let area = vm.meal.strArea { Text(area) }
                                            if let category = vm.meal.strCategory { Text(category) }
                                            if let tags = vm.meal.strTags { Text(tags) }
                                        }
                                        .padding(4)
                                        .background(Color.green)
                                        .cornerRadius(5)
                                        .foregroundStyle(.white)
                                    }
                                    .padding(.leading)
                                }
                                .frame(height: 265)
                                
                                
                                Button(action: {
                                    dismiss()
                                }, label: {
                                    Image(systemName: "chevron.left")
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundColor(.white)
                                        .padding(8)
                                        .background(Circle().fill(Color.gray))
                                })
                                .padding(.leading, 20)
                                .padding(.top, 40)
                            }
                            Text(vm.meal.strMeal)
                                .font(Font.system(size: 30, weight: .bold, design: .serif))
                                .lineLimit(2)
                                .padding(8)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("Instructions")
                                .padding(8)
                                .font(Font.system(size: 20, weight: .bold, design: .monospaced))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text(vm.meal.strInstructions ?? "")
                                .padding(8)
                                .font(Font.system(size: 14, weight: .light, design: .none))
                            
                            YouTubeView(videoId: vm.meal.uTubeId ?? "")
                                .frame(height: 300)
                                .padding(16)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                        .navigationBarBackButtonHidden(true)
                    }
                    .ignoresSafeArea()
                    
                    BasketButton(count: 0,
                                 incrementAction: {},
                                 decrementAction: {})
                    .padding()
                }
            }
        }
        .task {
            await vm.getMealsDetail(id: mealId)
        }
    }
}

#Preview {
    MealDetailsView(mealId: "52772")
}
