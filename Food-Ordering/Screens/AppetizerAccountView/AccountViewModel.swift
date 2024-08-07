//
//  AccountViewModel.swift
//  Food-Ordering
//
//  Created by rabie houssaini on 1/7/2024.
//

import SwiftUI

final class AccountViewModel : ObservableObject {
    @Published  var user  = User()
    @AppStorage("user") private var userData: Data?
    @Published var alertItem: AlertItem?
    
    init() {
        retrieveUser()
    }
    
    var isValidForm : Bool{
        guard  !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else{
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
    func retrieveUser(){
        guard let userData = userData else {return}
        do{
             user = try JSONDecoder().decode(User.self, from: userData)
        }catch {
            alertItem = AlertContext.invalidUserData

        }
    }
    func saveChanges(){
        guard isValidForm else{
            return
        }
        
        do{
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        }catch {
            alertItem = AlertContext.invalidUserData

        }
    }
}
