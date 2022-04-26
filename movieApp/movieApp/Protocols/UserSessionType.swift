//
//  UserSessionType.swift
//  movieApp
//
//  Created by Cris Messias on 26/04/22.
//

import Foundation


protocol UserSessionType {
        
    func isUserLogged() -> Bool
    func loadUserSession() -> UserSession?
    func logoutUserSession()
    var session: UserSession? { get set }
    
}
