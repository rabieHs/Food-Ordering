//
//  Order.swift
//  Food-Ordering
//
//  Created by rabie houssaini on 2/7/2024.
//

import Foundation
import SwiftUI

final class Order : ObservableObject {
    @Published var items : [Appetizer] = []
    
    var totlaPrice : Double {
        return items.reduce(0){ $0 + $1.price}
    }
}
