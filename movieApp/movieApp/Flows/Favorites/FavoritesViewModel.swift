//
//  FavoritesViewModel.swift
//  movieApp
//
//  Created by Cris Messias on 01/04/22.
//

import Foundation
import SwiftUI

class FavoritesViewModel: ObservableObject {
    var favoriteService: FavoriteType = UserDefaultsFavoriteService()
    @Published var favoriteList: [Movie] = []
    
    
    func loadFavorite() {
        let list = favoriteService.getFavorites()
        favoriteList = list
    }
    
}
