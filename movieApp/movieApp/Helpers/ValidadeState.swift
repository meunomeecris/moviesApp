//
//  ValidadeState.swift
//  movieApp
//
//  Created by Cris Messias on 19/04/22.
//

import Foundation

enum ValidationState {
    case valid
    case invalid
    case initial
    
    // Instantiate from a bool value
    static func fromBool(value: Bool) -> ValidationState {
        if value == true {
           return ValidationState.valid
        }
        return ValidationState.invalid
    }
    
    //Convert from a validation state to bool
    func toBool() -> Bool {
        switch self {
        case .initial, .invalid:
            return false
        case .valid:
            return true
        }
    }
}
