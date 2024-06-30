//
//  AppetizerDetailsView.swift
//  Food-Ordering
//
//  Created by rabie houssaini on 30/6/2024.
//

import SwiftUI

struct AppetizerDetailsView: View {
    let appetizer: Appetizer
    
    var body: some View {
        VStack{
           Image("asian-flank-steak")
                .resizable()
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
                    VStack(spacing:5){
                        Text("Calories")
                            .font(.caption)
                            .bold()
                        
                        Text("\(appetizer.calories) kc")
                            .foregroundStyle(Color(.secondaryLabel))
                            .fontWeight(.semibold)
                            .italic()
                    }
                    VStack(spacing:5){
                        Text("Carbs")
                            .font(.caption)
                            .bold()
                        
                        Text("\(appetizer.carbs) g")
                            .foregroundStyle(Color(.secondaryLabel))
                            .fontWeight(.semibold)
                            .italic()
                    }
                    VStack(spacing:5){
                        Text("Protein")
                            .font(.caption)
                            .bold()
                        
                        Text("\(appetizer.protein) g")
                            .foregroundStyle(Color(.secondaryLabel))
                            .fontWeight(.semibold)
                            .italic()
                    }
                }
                
            }
            Spacer()
            Button{
                
            }label: {
                Text("$\(appetizer.price,specifier: "%.2f") - Add To Order")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 260, height: 50)
                    .foregroundColor(.white)
                    .background(.brandPrimary)
                    .cornerRadius(10)
            }.padding(.bottom, 30)
               
        }
        .frame(width: 300,height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay( Button{}label: {
            ZStack{
                Circle()
                    .frame(width: 30,height: 30)
                    .foregroundColor(.white)
                    .opacity(0.6)
                
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .frame(width: 44,height: 44)
                    .foregroundColor(.black)

                  
            }

        },alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailsView(appetizer: MockData.sampleAppetizer)
}
