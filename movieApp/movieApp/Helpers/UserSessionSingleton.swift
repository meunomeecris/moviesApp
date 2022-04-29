//
//  UserSessionSingleton.swift
//  movieApp
//
//  Created by Cris Messias on 26/04/22.
//

import Foundation

class UserSessionSingleton: UserSessionType { //contralar a sessão entre serviços menores
    
    private let accessTokenService: AccessTokenServiceType
    static let shared = UserSessionSingleton()
    var session: UserSession?
    
    
    private init(){
        self.accessTokenService = AccessTokenService(keychainService: KeychainService())
        loadUserSession()
    }
    
    func loadUserSession() {
        let session = accessTokenService.loadAccessToken()
        self.session = session
    }
      
    func isUserLogged() -> Bool {
        //Pergunta que retorna true ou false
        return self.session != nil
    }
    
    func logoutUserSession() {
        _ = self.accessTokenService.deleteAccessToken()
        self.session = nil
    }
}
