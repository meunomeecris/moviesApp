//
//  FavoritesViewModel.swift
//  movieApp
//
//  Created by Cris Messias on 01/04/22.
//

import Foundation

class FavoritesViewModel {
    var favoriteService: FavoriteType = UserDefaultsFavoriteService()
    
    
    func favoriteList() -> [Movie] {
        let list = favoriteService.getFavorites()
        return list
    }
}
