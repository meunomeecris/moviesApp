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
    
    init() {
        loadUserSession()
    }

    func loadUserSession() {
        let session = accessTokenService.loadAccessToken()
        self.session = session
        setUserLogged(userSession: self.session)
    }
        
    func logoutUserSession() {
        _ = self.accessTokenService.deleteAccessToken()
        self.session = nil
        setUserLogged(userSession: self.session)
    }
    
    func saveUserSession(_ session: UserSession) -> Bool {
        let result = accessTokenService.saveAccessToken(value: session.token)
        // Only if result is true, we will set the session var on line 14 to the new created session
        if result {
            self.session = session
            setUserLogged(userSession: self.session)
        }
        return result
    }
    
    //MARK: - Private Methods
    
    private func setUserLogged(userSession: UserSession?) {
        if userSession != nil {
            isUserLogged =  true
        } else {
            isUserLogged = false
        }
    }
    
}
