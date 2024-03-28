//
//  PizzaCornerApp.swift
//  PizzaCorner
//
//  Created by Shayeeb War on 25/02/24.
//

import SwiftUI

@main
struct PizzaCornerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(menu: MenuModel().menu)
        }
    }
}
