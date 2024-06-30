//
//  ContentView.swift
//  Food-Ordering
//
//  Created by rabie houssaini on 26/6/2024.
//

import SwiftUI

struct FoodOrderingTabView: View {
    var body: some View {
        VStack {

          
                TabView{
                    HomeView()
                        .tabItem { Image(systemName: "house")
                            Text("Home")
                        }
                        
                    
                    AccountView()
                        .tabItem { Image(systemName: "person")
                            Text("Account")
                        }
                    
                    OrderView()
                        .tabItem { Image(systemName: "bag")
                            Text("Orders")
                        }
                }
                .accentColor(.primaryColor)
            
            
        }
   
    }
}

#Preview {
    FoodOrderingTabView()
}
