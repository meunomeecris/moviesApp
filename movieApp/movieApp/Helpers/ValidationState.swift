//
//  ValidationState.swift
//  movieApp
//
//  Created by Cris Messias on 18/04/22.
//

import Foundation

enum ValidationState {
    case valid
    case invalid
    case initial
    
    static func fromBool(value: Bool) -> ValidationState {
        if value == true {
           return ValidationState.valid
        }
        return ValidationState.invalid
    }
}
