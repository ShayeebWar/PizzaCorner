//
//  OrderRowView.swift
//  PizzaCorner
//
//  Created by Shayeeb War on 06/03/24.
//

import SwiftUI

struct OrderRowView: View {
    @Binding var order: OrderItem
    var body: some View {
        VStack {
            HStack {
                Text(order.item.name)
                Spacer()
            }
            HStack(alignment: .firstTextBaseline) {
                Text(order.quantity, format: .number)
                Text(order.item.price, format: .currency(code: "USD"))
                Spacer()
                Text(order.extPrice, format: .currency(code: "USD"))
                    .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    OrderRowView(order: .constant(testOrderItem))
}
