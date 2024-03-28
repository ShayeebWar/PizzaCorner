//
//  RatingsView.swift
//  PizzaCorner
//
//  Created by Shayeeb War on 11/03/24.
//

import SwiftUI

struct RatingsView: View {
    var rating: Int
    var body: some View {
        HStack {
            ForEach(1...6, id: \.self) { circle in
                 Image(systemName: (circle <= rating) ? "fork.knife.circle.fill" : "circle")
            }
        }
    }
}

#Preview {
    RatingsView(rating: 4)
}
