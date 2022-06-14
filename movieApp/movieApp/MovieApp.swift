//
//  movieAppApp.swift
//  movieApp
//
//  Created by Cris Messias on 25/02/22.
//

import SwiftUI

@main
struct MovieAppApp: App {
    // Creating session controller as state object, to be contained inside this MovieApp Struct
    @StateObject var sessionController: UserSessionController = UserSessionController()
    
    var body: some Scene {
        WindowGroup {
            AppStateSwitcher()
                .environmentObject(sessionController) // Here in this line we are transforming it into a environment object
        }
    }
}

// Method to control the app flow based on the user session result

struct AppStateSwitcher: View {
    // The environment object instance will be passed on by MovieApp struct to all the views below it
    @EnvironmentObject var sessionController: UserSessionController
    
    var body: some View {
        if sessionController.isUserLogged {
            MenuView()
        } else {
            LoginView()
        }
    }
}
