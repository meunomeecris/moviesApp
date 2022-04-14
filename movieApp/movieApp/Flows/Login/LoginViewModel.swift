//
//  LoginViewModel.swift
//  movieApp
//
//  Created by Cris Messias on 13/04/22.
//

import Foundation
import SwiftUI


class LoginViewModel: ObservableObject{
    
    @State var usernameInput: String = ""
    @State var passwordInput: String = ""
    
    var usernameValidOutput: Bool = false
    var passwordValidOutput: Bool = false
    
    func validateInputs() {
        usernameValidOutput = Validator.validateEmail(email: usernameInput)
        passwordValidOutput = Validator.validatePassword(password: passwordInput)
    }

}




