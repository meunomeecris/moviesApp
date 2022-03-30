//
//  InMemoryFavoriteService.swift
//  movieApp
//
//  Created by Cris Messias on 30/03/22.
//

import Foundation



class InMemoryFavoriteService: FavoriteType {
    
    var favorites: [Movie] = [Movie] () //salvando na memória do celular
    
    func getFavorites() -> [Movie] {
        return self.favorites
    }
    
    func isFavorited(movie: Movie) -> Bool {
        if favorites.contains(movie) {
            return true
        } else {
            return false
        }
    }
    
    func addToFavorite(movie: Movie) {
        favorites.append(movie)
    }
    
    func removeFromFavorite(movie: Movie) {
        if let movieIndex = favorites.firstIndex(of: movie) {
            favorites.remove(at: movieIndex)
        }
    }
}
