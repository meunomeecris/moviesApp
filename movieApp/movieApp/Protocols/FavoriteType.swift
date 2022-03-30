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
    func getFavorites() -> [Movie]
    var favorites: [Movie]  { get set }
}



