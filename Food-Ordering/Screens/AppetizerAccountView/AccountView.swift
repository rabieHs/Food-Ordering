//
//  AccountView.swift
//  Food-Ordering
//
//  Created by rabie houssaini on 28/6/2024.
//

import SwiftUI

struct AccountView: View {
    @StateObject  var viewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    enum FormTextField  {
        case firstName, lastName, email
    }
    var body: some View {
        NavigationView{
            Form{
                Section(content: {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit {
                            focusedTextField = .lastName
                        }
                        .submitLabel(.next)
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .onSubmit {
                            focusedTextField = .email
                        }
                        .focused($focusedTextField, equals: .lastName)
                        .submitLabel(.next)
                    TextField("Email", text: $viewModel.user.email)
                        .onSubmit {
                            focusedTextField = nil
                        }
                        .focused($focusedTextField, equals: .email)
                        .submitLabel(.continue)
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
            .toolbar{
                ToolbarItemGroup(placement: .keyboard, content: {
                    Button("Dismiss", action: {
                        focusedTextField = nil
                    })
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
