//
//  BasketButton.swift
//  FoodOrder
//
//  Created by Arvinth Manivasakan on 03/06/25.
//

import SwiftUI

typealias Action = @MainActor () -> Void

struct BasketButton: View {
    
    var count: Int
    var incrementAction: Action
    var decrementAction: Action
    
    var body: some View {
        if count > 0 {
            HStack {
                Button("+", action: incrementAction)
                .foregroundStyle(Color.white)
                .font(.largeTitle)
                .padding(.leading, 4)
                
                Spacer()

                Text("\(count)")
                    .foregroundStyle(Color.white)
                    .font(.title)
                
                Spacer()
                
                Button("-", action: decrementAction)
                .foregroundStyle(Color.white)
                .font(.largeTitle)
                .padding(.trailing, 4)
            }
            .frame(maxWidth: .infinity)
            .background(Color.red)
            .cornerRadius(5)
        } else {
            Button("Add", action: incrementAction)
                .foregroundStyle(Color.white)
                .font(.title)
                .frame(maxWidth: .infinity)
                .background(Color.red)
                .cornerRadius(5)
                .padding(4)

        }
    }
}

#Preview {
    BasketButton(count: 0, incrementAction: {}, decrementAction: {})
}
