//
//  User.swift
//  Food-Ordering
//
//  Created by rabie houssaini on 1/7/2024.
//

import Foundation

struct User : Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
