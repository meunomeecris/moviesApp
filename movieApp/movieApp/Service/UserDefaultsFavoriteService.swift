//
//  File.swift
//  movieApp
//
//  Created by Cris Messias on 30/03/22.
//

import Foundation

// chave-valor
class UserDefaultsFavoriteService: FavoriteType {
    var favorites: [Movie] = []
    private let favoriteKey: String = "favorite"
    
    func isFavorited(movie: Movie) -> Bool {
        return false
    }
    
    func addToFavorite(movie: Movie) {
        do {
            favorites.append(movie)
            let encodedArray = try JSONEncoder().encode(favorites)
            UserDefaults.standard.set(encodedArray, forKey: favoriteKey)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func removeFromFavorite(movie: Movie) {
        
    }
    
    func getFavorites() -> [Movie] {
        return favorites
    }
}
