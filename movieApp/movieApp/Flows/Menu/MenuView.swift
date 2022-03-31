//
//  TabView.swift
//  movieApp
//
//  Created by Cris Messias on 31/03/22.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        HStack{
            TabView{
                HomeView()
                    .tabItem() {
                        Image(systemName: "film")
                        Text("Now Playing")
                    }
                FavoritesView()
                    .tabItem() {
                        Image(systemName: "star")
                        Text("My Favorites")
                    }
            }
        }
        .foregroundColor(Color(.systemGray))
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
