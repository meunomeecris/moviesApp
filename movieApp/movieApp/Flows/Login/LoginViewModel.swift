//
//  LoginViewModel.swift
//  movieApp
//
//  Created by Cris Messias on 13/04/22.
//

import Foundation
import SwiftUI


class LoginViewModel: ObservableObject {
    
    //coleto dados da viem
    @Published var usernameInput: String = ""
    @Published var passwordInput: String = ""
    
    //devolver para view os inputs validadeos
    @Published var usernameValidOutput: ValidationState = ValidationState.initial
    @Published var passwordValidOutput: ValidationState = ValidationState.initial
    
    //validar o botão se os campos estiverem validados
    @State var isLoginButtonEnabled: Bool = false
    
    //validar os dados coletados
    func validateInputs() {
        usernameValidOutput = Validator.validateEmail(email: usernameInput)
        passwordValidOutput = Validator.validatePassword(password: passwordInput)
        
//        if usernameValidOutput && passwordValidOutput == ValidationState.valid {
//            isLoginButtonEnabled =  true
//        } else {
//            isLoginButtonEnabled = false
//        }
    }
}



