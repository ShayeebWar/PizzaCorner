//
//  StatusBarView.swift
//  PizzaCorner
//
//  Created by Shayeeb War on 18/03/24.
//

import SwiftUI

struct StatusBarView: View {
    @Binding var showMenuGrid:Bool
    @EnvironmentObject var orders:OrderModel
    var body: some View {
        HStack {
            Text("\(orders.orderItems.count) count")
            Spacer()
            
            Button {
                showMenuGrid.toggle()
            } label: {
                Image(systemName: showMenuGrid ? "square.grid.3x2" : "list.bullet")
            }
            .padding(.leading,10)
            
            Spacer()
            Label{
                Text(orders.orderTotal, format: .currency(code: "USD"))
            }
        icon: {
            Image(systemName: orders.orderItems.isEmpty ? "cart" : "cart.circle.fill")
        }
        }
        .foregroundStyle(.black)
        .font(.title2)
    }
}

#Preview {
    StatusBarView(showMenuGrid: .constant(true)).environmentObject(OrderModel())
        .background(.white)
}
