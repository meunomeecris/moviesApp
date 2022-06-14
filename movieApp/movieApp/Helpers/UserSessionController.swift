//
//  UserSessionSingleton.swift
//  movieApp
//
//  Created by Cris Messias on 26/04/22.
//

import Foundation
import SwiftUI

class UserSessionController: UserSessionType, ObservableObject { //contralar a sessão entre serviços menores
    
    private var accessTokenService: AccessTokenServiceType = AccessTokenService(keychainService: KeychainService())
    var session: UserSession?
    
    @Published var isUserLogged: Bool = false
    
    init(){
        loadUserSession()
    }

    func loadUserSession() {
        let session = accessTokenService.loadAccessToken()
        self.session = session
    }
        
    func logoutUserSession() {
        _ = self.accessTokenService.deleteAccessToken()
        self.session = nil
    }
    
    func saveUserSession(_ session: UserSession) -> Bool {
        let result = accessTokenService.saveAccessToken(value: session.token)
        if result {
            self.session = session
            setUserLogged(userSession: self.session)
        }
        return result
    }
    
    
    //MARK: - Private Method
    
    private func setUserLogged(userSession: UserSession?) {
        if userSession != nil {
            isUserLogged =  true
        } else {
            isUserLogged = false
        }
    }
    
}
