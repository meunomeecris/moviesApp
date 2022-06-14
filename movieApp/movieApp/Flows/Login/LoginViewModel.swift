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
    @Published var isLoginButtonEnabled: Bool = false
    
    // User session controller
    @EnvironmentObject private var sessionController: UserSessionController
    
    //validar os dados coletados da view - usando o Validator (regex)
    func validateInputs() {
        usernameValidOutput = Validator.validateEmail(email: usernameInput)
        passwordValidOutput = Validator.validatePassword(password: passwordInput)
        if usernameValidOutput.toBool() && passwordValidOutput.toBool() {
            isLoginButtonEnabled = true
        } else {
            isLoginButtonEnabled = false
        }
    }
    
    func login() -> UserSession {
       // The login logic here is mocked just for learning purposes. In the reality we will provide the crendentials to an endpoint and if they are correct, a token will be returned
        let fakeToken = "\(usernameInput)\(passwordInput)"
        var hasher = Hasher()
        hasher.combine(fakeToken)
        let hash = hasher.finalize()
        
        let userSession = UserSession(token: String(hash))
  
        return userSession
    }
}



