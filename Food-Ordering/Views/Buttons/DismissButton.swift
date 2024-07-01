//
//  DismissButton.swift
//  Food-Ordering
//
//  Created by rabie houssaini on 1/7/2024.
//

import SwiftUI

struct DismissButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 30,height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44,height: 44)
                .foregroundColor(.black)

              
        }    }
}

#Preview {
    DismissButton()
}
