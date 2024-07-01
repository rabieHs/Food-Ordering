//
//  APButton.swift
//  Food-Ordering
//
//  Created by rabie houssaini on 1/7/2024.
//

import SwiftUI

struct APButton: View {
    let title : LocalizedStringKey
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(.brandPrimary)
            .cornerRadius(10)
    }
}

#Preview {
    APButton(title: "")
}
