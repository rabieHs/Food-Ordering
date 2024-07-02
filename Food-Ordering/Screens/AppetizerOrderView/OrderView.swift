//
//  OrderView.swift
//  Food-Ordering
//
//  Created by rabie houssaini on 28/6/2024.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order : Order
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    List{
                        ForEach(order.items){appetizer in
                            
                                AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: { indexSet in
                            order.items.remove(atOffsets: indexSet)
                        })
                    }
                    .listStyle(.plain)
                    
               
                    
                    Button{
                        
                    }label: {
                       Text("$\(order.totlaPrice,specifier: "%.2f") - Place Order")
                            

                    }
                    .modifier(StandartButtonStyle())
                    .padding(.bottom,25)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in your orders. Please add an appetizer")
                }
                   
            }
            .navigationTitle("Orders")
            
        }
    }
}

#Preview {
    OrderView()
}
