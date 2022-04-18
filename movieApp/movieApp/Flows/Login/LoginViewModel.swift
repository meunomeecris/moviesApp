//
//  LoginViewModel.swift
//  movieApp
//
//  Created by Cris Messias on 13/04/22.
//

import Foundation
import SwiftUI


class LoginViewModel: ObservableObject{
    
    @Published var usernameInput: String = ""
    @Published var passwordInput: String = ""
    
    @Published var usernameValidOutput: ValidationState = ValidationState.initial
    @State var passwordValidOutput: ValidationState = ValidationState.initial
    
    @State var isLoginButtonEnabled: Bool = false
    
    
    func validateInputs() {
        let isEmailValid = Validator.validateEmail(email: usernameInput)
        let isPasswordValid = Validator.validatePassword(password: passwordInput)
        isLoginButtonEnabled = isEmailValid && isPasswordValid
    
        usernameValidOutput = ValidationState.fromBool(value:isEmailValid)
        passwordValidOutput = ValidationState.fromBool(value: isPasswordValid)
    }
}



