//
//  AppetizerViewModel.swift
//  Food-Ordering
//
//  Created by rabie houssaini on 29/6/2024.
//

import Foundation

class AppetizerViewModel:ObservableObject {
    @Published var appetizers : [Appetizer] = []
    @Published var alertItem : AlertItem?
    @Published var isLoading = false
    @Published  var isShowingDetails = false
    @Published  var selectedItem: Appetizer?
    
 
    
    func showDetailsView(appetizer: Appetizer){
        selectedItem = appetizer
        isShowingDetails = true
    }
//    func getAppetizers(){
//        NetworkManager.shared.getAppetizers {(result) in
//            
//            DispatchQueue.main.async {
//                self.isLoading = true
//
//                switch(result){
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//                    self.isLoading = false
//
//
//                case .failure(let error):
//                    self.isLoading = false
//
//                    switch error {
//                    case.invalidData:
//                        self.alertItem = AlertContext.invalidData
//                    
//                    case .invalidURL:
//                        self.alertItem = AlertContext.invalidURL
//
//                    case .invalidResponse:
//                        self.alertItem = AlertContext.invalidResponse
//
//                    case .unableToComplete:
//                        self.alertItem = AlertContext.unableToComplete
//
//                    }
//                    
//                }
//            }
//        }
//    }
    
    func getAppetizers(){
        isLoading = true
        
        Task{
            do{
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false

            }catch{
                if let APerror = error as? APError {
                    switch APerror {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }else{
                    alertItem = AlertContext.invalidResponse

                }
                
                isLoading = false

            }
        }
    }
  
}
