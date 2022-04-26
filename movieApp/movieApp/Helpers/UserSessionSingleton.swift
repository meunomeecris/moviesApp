//
//  UserSessionSingleton.swift
//  movieApp
//
//  Created by Cris Messias on 26/04/22.
//

import Foundation

class UserSessionSingleton: UserSessionType {
    
    func loadUserSession() -> UserSession? {
        <#code#>
    }
    
    var session: UserSession?
    
    func isUserLogged() -> Bool {
        <#code#>
    }
    
    func logoutUserSession() {
        <#code#>
    }
    
    
    static let shared = UserSessionSingleton()
    
    private init(){}
    
    func funcName(){
        //Code Process
    }
}
