//
//  FavoritesView.swift
//  movieApp
//
//  Created by Cris Messias on 31/03/22.
//

import SwiftUI

struct FavoritesView: View {
    var userDefaultsFavoriteService: FavoriteType = UserDefaultsFavoriteService()
    
    var body: some View {
        List{
            ForEach(userDefaultsFavoriteService.favorites) { favorite in
                Text("\(favorite.title)")
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
