//
//  Validator.swift
//  movieApp
//
//  Created by Cris Messias on 14/04/22.
//

import Foundation

class Validator {
    static func validateEmail(email: String) -> Bool {
        if email.isEmpty { return false }
        //^[\w\.]+@([\w-]+\.)+[\w-]{2,4}$
        let pattern = "^[\\w\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$"
        let regex: NSRegularExpression = try! NSRegularExpression(pattern: pattern)
        return regex.matches(email)
    }
    
    static func validatePassword(password: String, length: Int = 6) -> Bool{
        return false
    }
}
