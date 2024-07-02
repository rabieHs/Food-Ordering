//
//  EmptyState.swift
//  Food-Ordering
//
//  Created by rabie houssaini on 2/7/2024.
//

import SwiftUI

struct EmptyState: View {
    let imageName : String
    let message : String
    
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            VStack{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
                 
                    
            }
            .offset(y:-50)
        }
    }
}

#Preview {
    EmptyState(imageName: "empty-order", message: "default message")
}
