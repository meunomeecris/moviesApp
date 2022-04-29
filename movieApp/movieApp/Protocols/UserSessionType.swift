//
//  UserSessionType.swift
//  movieApp
//
//  Created by Cris Messias on 26/04/22.
//

import Foundation


protocol UserSessionType: ObservableObject {
        
    var isUserLogged: Bool { get set }
    func loadUserSession()
    func logoutUserSession()
    var session: UserSession? { get set }
}
