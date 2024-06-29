//
//  HomeView.swift
//  Food-Ordering
//
//  Created by rabie houssaini on 28/6/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = AppetizerViewModel()
    @State private var appetizers : [Appetizer] = []
    
    
   
    
    var body: some View {
        ZStack{
            NavigationView {
                List(viewModel.appetizers){appetizer in
                   AppetizerListCell(appetizer: appetizer)
                }.listStyle(.plain)
                .navigationTitle("Home")
                }
            if viewModel.isLoading{
                LoadingView()
            }
            }
            .alert(item: $viewModel.alertItem) { alert in
                Alert(title: alert.title,
                      message: alert.message,
                      dismissButton: alert.dismissButton)
        }
        
           
        
    }
    
  
}

#Preview {
    HomeView()
}
