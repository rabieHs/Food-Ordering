//
//  Alert.swift
//  Food-Ordering
//
//  Created by rabie houssaini on 29/6/2024.
//

import SwiftUI

struct AlertItem:Identifiable {
    let id = UUID()
    let title : Text
    let message: Text
    let dismissButton : Alert.Button
}

struct AlertContext {
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("The data recived from he server was invalid"),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Invalid Response"),
                                       message: Text("Invalid response from the server"),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidURL = AlertItem(title: Text("Invalid Url"),
                                       message: Text("There is an issue connecting to the server"),
                                       dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Unable to complete"),
                                       message: Text("Unable to complete your request"),
                                       dismissButton: .default(Text("OK")))
    
    
    
    static let invalidForm = AlertItem(title: Text("Invalid Form"),
                                       message: Text("Please make sure all fields in the form have been filled out"),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidEmail = AlertItem(title: Text("Invalid Email"),
                                       message: Text("Please ensure your email is correct"),
                                       dismissButton: .default(Text("OK")))
    static let userSaveSuccess = AlertItem(title: Text("Profile Saved"),
                                       message: Text("Your profile information was successfully saved"),
                                       dismissButton: .default(Text("OK")))
    static let invalidUserData = AlertItem(title: Text("Profile Error"),
                                       message: Text("there was an error saving or retrieving user data"),
                                       dismissButton: .default(Text("OK")))
}




