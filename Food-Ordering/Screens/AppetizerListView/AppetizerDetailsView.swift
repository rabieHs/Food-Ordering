//
//  AppetizerDetailsView.swift
//  Food-Ordering
//
//  Created by rabie houssaini on 30/6/2024.
//

import SwiftUI

struct AppetizerDetailsView: View {
    let appetizer: Appetizer
    @Binding var isShowingDetails: Bool
    
    var body: some View {
        VStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300,height: 225)
            
            VStack{
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing:20){
                  
                    NutritionInfo(title: "Calories", value: appetizer.calories)
                    NutritionInfo(title: "Carbs", value: appetizer.carbs)
                    NutritionInfo(title: "Protein", value: appetizer.protein)
                }
                
            }
            Spacer()
            Button{
                
            }label: {
              APButton(title: "$\(appetizer.price,specifier: "%.2f") - Add To Order")
            }.padding(.bottom, 30)
               
        }
        .frame(width: 300,height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay( Button{
            isShowingDetails = false
        }label: {
            DismissButton()

        },alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailsView(appetizer: MockData.sampleAppetizer, isShowingDetails: .constant(true))
}


struct NutritionInfo : View {
     let title : String
     let value : Int
    var body: some View {
        VStack(spacing:5){
            Text(title)
                .font(.caption)
                .bold()
            
            Text("\(value) kc")
                .foregroundStyle(Color(.secondaryLabel))
                .fontWeight(.semibold)
                .italic()
        }
    }
}
