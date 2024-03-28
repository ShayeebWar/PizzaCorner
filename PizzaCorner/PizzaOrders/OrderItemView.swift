//
//  OrderItemView.swift
//  PizzaCorner
//
//  Created by Shayeeb War on 18/03/24.
//

import SwiftUI

struct OrderItemView: View {
    @Binding var orderItem: OrderItem
    @State private var quantity = 1
    @State private var doubleIngredients = false
    @State private var pizzaCrust: PizzaCrust
    @State private var name = ""
    @State private var comments = ""
    init(orderItem: Binding<OrderItem>) {
        self._orderItem = orderItem
        self.pizzaCrust = orderItem.item.crust.wrappedValue
    }
    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Toggle(isOn: $doubleIngredients) {
                Text("Double Ingredients " + (doubleIngredients ? "Yes" : "No"))
            }
            Stepper(value: $quantity,in: 1...10) {
                Text("\(quantity) " + (quantity == 1 ? "Pizza" : "Pizzas"))
            }
            Picker(selection: $pizzaCrust) {
                ForEach(PizzaCrust.allCases, id: \.self) { crust in
                    Text(crust.rawValue).tag(crust)
                }
            } label: {
                Text("Pizza Crust")
            }
            .pickerStyle(MenuPickerStyle())
            Spacer()
            
            VStack {
                Text("Comments")
                TextEditor(text: $comments)
            }
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .shadow(radius: 3)
            .padding()
        }
        .padding(10)
    }
}

#Preview {
    OrderItemView(orderItem: .constant(testOrderItem))
}
