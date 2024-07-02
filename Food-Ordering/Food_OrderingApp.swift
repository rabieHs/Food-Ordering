//
//  Food_OrderingApp.swift
//  Food-Ordering
//
//  Created by rabie houssaini on 26/6/2024.
//

import SwiftUI

@main
struct Food_OrderingApp: App {
    var order = Order()
    var body: some Scene {
        WindowGroup {
            FoodOrderingTabView().environmentObject(order)
        }
    }
}
