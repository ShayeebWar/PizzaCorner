//
//  MenuItemView.swift
//  PizzaCorner
//
//  Created by Shayeeb War on 06/03/24.
//

import SwiftUI

struct MenuItemView: View {
    @State private var addedItem: Bool = false
    @Binding var item:MenuItem
    @ObservedObject var orders: OrderModel
    @State private var showAlert = false
    var body: some View {
        VStack {
            HStack {
                Text(item.name)
                    .font(.title)
                    .fontWeight(.semibold)
                //                    .foregroundColor(Color("Surf"))
                    .foregroundStyle(.ultraThickMaterial)
                    .padding(.leading)
                    
                if let image = UIImage(named: "\(item.id)_lg"){
                    Image(uiImage: image)
                    ///.clipShape(RoundedRectangle(cornerRadius: 20))
                        .resizable()
                        .scaledToFit()
                        .padding([.top,.bottom],5)
                        .cornerRadius(20)
                } else {
                    Image("surfboard_lg")
                        .resizable()
                        .scaledToFit()
                        .rotationEffect(Angle(degrees: 180))
                }
            }
            .background(.linearGradient(colors: [Color("Surf"), Color("Sky").opacity(0.1)], startPoint: .leading, endPoint: .trailing), in: Capsule())
            .shadow(color:.teal, radius: 5, x: 8,y: 8)

            VStack() {
                ScrollView {
                    Text(item.description)
                        .font(.custom("Georgia", size: 14, relativeTo: .body))
                }
            }
            Button{
                showAlert = true
                
            }label: {
                Spacer()
                Text(item.price, format: .currency(code: "USD")).bold()
                Image(systemName: addedItem ? "cart.fill.badge.plus" : "cart.badge.plus")
                Spacer()
            }
            .disabled(item.id < 0)
            .padding()
            .foregroundStyle(.white)
            .background(.red, in: Capsule())
            .padding(5)
            .alert("Add \(item.name) to the cart?", isPresented: $showAlert) {
                Button("No", role: .cancel){}
                Button("Yes"){
                    addedItem = true
                    orders.addOrder(item, quantity: 1)
                }
                Button("Make it a double"){
                    addedItem = true
                    orders.addOrder(item, quantity: 2)
                }
            }

        }
    }
}

#Preview {
    MenuItemView(item: .constant(testMenuItem), orders: OrderModel())
}
