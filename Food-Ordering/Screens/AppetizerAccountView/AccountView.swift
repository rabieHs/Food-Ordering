//
//  AccountView.swift
//  Food-Ordering
//
//  Created by rabie houssaini on 28/6/2024.
//

import SwiftUI

struct AccountView: View {
    @StateObject  var viewModel = AccountViewModel()
   
    var body: some View {
        NavigationView{
            Form{
                Section(content: {
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.none)
                    .autocorrectionDisabled(true)
                    DatePicker("Birthday", selection: $viewModel.user.birthdate, displayedComponents: .date)
                    .environment(\.locale, Locale(identifier: "us"))
                    .datePickerStyle(.automatic)
                Button{
                    viewModel.saveChanges()
                }label: {
                    Text("Save Changes")
                }
                    

            }, header: {Text("Personal Info")})
            
                
                Section(content: {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                        .tint(.primaryColor)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                        .tint(.primaryColor)
                }, header: {
                    Text("Requests")
                })
                

            }
                .navigationTitle("Account")
        }.alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title,message: alert.message, dismissButton: alert.dismissButton)
                
        }
       
    }
}

#Preview {
    AccountView()
}
