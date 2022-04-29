//
//  movieAppApp.swift
//  movieApp
//
//  Created by Cris Messias on 25/02/22.
//

import SwiftUI

@main
struct MovieAppApp: App {
    @EnvironmentObject var userSessionController: UserSessionController = UserSessionController()
    
    var body: some Scene {
        WindowGroup {
            if userSessionController.isUserLogged {
                MenuView()
            } else {
                LoginView()
            }
        }
    }
}
