//
//  CustomModifiers.swift
//  Food-Ordering
//
//  Created by rabie houssaini on 2/7/2024.
//

import Foundation
import SwiftUI

struct StandartButtonStyle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .controlSize(.large)
            .tint(.primaryColor)
    }
    
    
}
