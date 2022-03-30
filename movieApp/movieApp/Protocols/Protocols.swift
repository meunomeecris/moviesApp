//
//  Protocols.swift
//  movieApp
//
//  Created by Cris Messias on 30/03/22.
//

import Foundation

//objetos diferentes com comportamentos iguais
//Definindo o tipo  - não conhece o tipo de implementação
protocol FavoriteType {
    func isFavorited(movie: Movie) -> Bool
    func addToFavorite(movie: Movie)
    func removeFromFavorite(movie: Movie)
}

class InMemoryFavoriteMovies: FavoriteType {
    
    var favoriteList = [Movie] () //salvando na memória do celular
    
    func isFavorited(movie: Movie) -> Bool {
        if favoriteList.contains(movie) {
            return true
        } else {
            return false
        }
    }
    
    func addToFavorite(movie: Movie) {
        favoriteList.append(movie)
    }
    
    func removeFromFavorite(movie: Movie) {
        if let movieIndex = favoriteList.firstIndex(of: movie) {
            favoriteList.remove(at: movieIndex)
        }
    }
}

