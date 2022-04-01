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
        if favorites.contains(movie) {
            return true
        } else {
            return false
        }
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
        do {
            if let movieIndex = favorites.firstIndex(of: movie) {
                favorites.remove(at: movieIndex)
            }
            let encodedArray = try JSONEncoder().encode(favorites)
            UserDefaults.standard.set(encodedArray, forKey: favoriteKey)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func getFavorites() -> [Movie] {
        do {
            let objectFromDisk = UserDefaults.standard.object(forKey: favoriteKey)
            let decodedArray = try JSONDecoder().decode([Movie].self, from: objectFromDisk as! Data)//typecast
            favorites = decodedArray

        } catch let error {
            print(error.localizedDescription)
        }
        return favorites
    }
    
}
