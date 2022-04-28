//
//  LoginViewModel.swift
//  movieApp
//
//  Created by Cris Messias on 13/04/22.
//

import Foundation
import SwiftUI


class LoginViewModel: ObservableObject {
    
    //coletar dados da view
    @Published var usernameInput: String = ""
    @Published var passwordInput: String = ""
    
    //devolver para view os inputs validadeos
    @Published var usernameValidOutput: ValidationState = ValidationState.initial
    @Published var passwordValidOutput: ValidationState = ValidationState.initial
    
    //validar o botão se os campos estiverem validados
    @State var isLoginButtonEnabled: Bool = false
    
    //validar os dados coletados da view - usando o Validator (regex)
    func validateInputs() {
        usernameValidOutput = Validator.validateEmail(email: usernameInput)
        passwordValidOutput = Validator.validatePassword(password: passwordInput)
    }
}



