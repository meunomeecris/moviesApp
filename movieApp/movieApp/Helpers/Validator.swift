//
//  Validator.swift
//  movieApp
//
//  Created by Cris Messias on 14/04/22.
//

import Foundation

class Validator {
    static func validateEmail(email: String) -> Bool { // para teste unitário
        if email.isEmpty { return false }
        //^[\w\.]+@([\w-]+\.)+[\w-]{2,4}$
        let pattern = "^[\\w\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$"
        let regex: NSRegularExpression = try! NSRegularExpression(pattern: pattern)
        return regex.matches(email)
    }
    
    static func validateEmail(email: String) -> ValidationState {
        if email.isEmpty { return .initial }
        //^[\w\.]+@([\w-]+\.)+[\w-]{2,4}$
        let pattern = "^[\\w\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$"
        let regex: NSRegularExpression = try! NSRegularExpression(pattern: pattern)
        if regex.matches(email) { return .valid}
        return .invalid
    }
    
    static func validatePassword(password: String, length: Int = 6) -> Bool { //future add regex
        if password.isEmpty || password.count < length {
            return false
        }
        return true
    }
    
    static func validatePassword(password: String, length: Int = 6) -> ValidationState { //future add regex
        if password.isEmpty {
            return ValidationState.initial
        } else if password.count < length {
            return ValidationState.invalid
        }
        return ValidationState.valid
    }
}
