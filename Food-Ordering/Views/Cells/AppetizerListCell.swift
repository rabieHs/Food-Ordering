//
//  AppetizerListCell.swift
//  Food-Ordering
//
//  Created by rabie houssaini on 28/6/2024.
//

import SwiftUI

struct AppetizerListCell: View {
    let appetizer: Appetizer
    var body: some View {
        HStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120,height: 90)
                .cornerRadius(8)
            
            VStack(alignment:.leading,spacing: 5){
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(appetizer.price, specifier: "%.1f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
