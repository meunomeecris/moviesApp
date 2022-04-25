//
//  AuthenticationSingleton.swift
//  movieApp
//
//  Created by Cris Messias on 25/04/22.
//

import Foundation


protocol UserSessionType {
    
    var session: UserSession?{
        get {
            
        } set {
            
        }
    }
    
    func isUserLogged() -> Bool
    func loadUserSession() -> UserSession?
    func logoutUserSession()
}




class UserSessionSingleton: UserSessionType {
    
    static let shared = UserSessionSingleton()
    
    private init(){}
    
    func funcName(){
        //Code Process
    }
}
