//
//  movieAppApp.swift
//  movieApp
//
//  Created by Cris Messias on 25/02/22.
//

import SwiftUI

@main
struct MovieAppApp: App {
    @StateObject var sessionController: UserSessionController = UserSessionController()
    
    var body: some Scene {
        WindowGroup {
            AppStateSwitcher()
                .environmentObject(sessionController)
        }
    }
}


struct AppStateSwitcher: View {
    @EnvironmentObject var userSessionController: UserSessionController
    var body: some View {
        if userSessionController.isUserLogged {
            MenuView()
        } else {
            LoginView()
        }
    }
}
