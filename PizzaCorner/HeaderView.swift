//
//  HeaderView.swift
//  PizzaCorner
//
//  Created by Shayeeb War on 06/03/24.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var orders: OrderModel
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image("surfBanner")
                    .resizable()
                    .scaledToFit()
                Text("Pizza Corner")
                    .font(.custom("Georgia", size: 30, relativeTo: .title))
                //                .foregroundColor(Color("Sky"))
                    .foregroundStyle(.regularMaterial)
                    .fontWeight(.semibold)
            }
        }
        .background(.ultraThinMaterial)
    }
}

#Preview {
    HeaderView().environmentObject(OrderModel())
}
