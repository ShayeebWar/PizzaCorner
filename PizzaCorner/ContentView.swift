//
//  ContentView.swift
//  PizzaCorner
//
//  Created by Shayeeb War on 25/02/24.
//

import SwiftUI

struct ContentView: View {
    var menu: [MenuItem]
    @StateObject  var orders: OrderModel = OrderModel()
    @State private var selectedItem:MenuItem = noMenuItem
    @State private var showMenuGrid = false
    var body: some View {
        TabView {
            VStack{
                HeaderView()
                    .shadow(radius: 5)
                    .environment(\.colorScheme, .light)
                StatusBarView(showMenuGrid: $showMenuGrid)
                MenuItemView(item: $selectedItem, orders: orders)
                    .padding(5)
                    .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10))
                if showMenuGrid{
                    MenuGridView(menu: menu, selectedItem: $selectedItem)
                } else{
                    MenuView(menu: menu, selectedItem: $selectedItem)
                }
            }
            .tabItem {
                Label("Menu", systemImage: "list.bullet")
            }
            VStack{
                HeaderView()
                    .shadow(radius: 5)
                    .environment(\.colorScheme, .light)
                StatusBarView(showMenuGrid: $showMenuGrid)
                OrderView(orders: orders)
                    .cornerRadius(10)
            }
            .tabItem {
                Label("Orders", systemImage: "cart")
            }
            
        }
            .padding()
            .background(.linearGradient(colors: [.cyan, Color("Surf"), Color("Sky"), .white], startPoint: .topLeading, endPoint: .bottom))
            .environmentObject(orders)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(menu: MenuModel().menu)
    }
}

