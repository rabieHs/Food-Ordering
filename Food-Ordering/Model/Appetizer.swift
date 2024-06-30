//
//  Appetizer.swift
//  Food-Ordering
//
//  Created by rabie houssaini on 28/6/2024.
//

import Foundation

struct Appetizer: Codable , Identifiable {
    
    let id : Int
    let name : String
    let description : String
    let price : Double
    let imageURL : String
    let calories : Int
    let carbs : Int
    let protein : Int
}

struct AppetizerResponse : Codable {
    let request : [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 1, name: "Asian Flank Steak", description: "This perfectly thin cut just melts in your mouth.", price: 8.99, imageURL: "", calories: 300, carbs: 1, protein: 0)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
