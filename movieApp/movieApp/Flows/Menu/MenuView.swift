//
//  TabView.swift
//  movieApp
//
//  Created by Cris Messias on 31/03/22.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem() {
                    Label("Now Playing", systemImage: "film")
                }
            FavoritesView()
                .tabItem() {
                    Label("My Favorites", systemImage: "star")
                }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
