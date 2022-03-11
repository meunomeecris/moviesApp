//
//  HomeViewModel.swift
//  movieApp
//
//  Created by Cris Messias on 09/03/22.
//

import Foundation

//princípio da responsabilidade
//ViewModel recebe e entrega dados (output)

class HomeViewModel: ObservableObject { //regra de negócios - comunica com outras camadas //permitir observação
    
    var movieService: MovieService = MovieService() //especificar o tipo
    @Published var movies: [Movie] = [] //array vazia
    //@Published - swiftui - acompanhar mudanças
    
    
    func getNowPlaying() {
        movieService.getNowPlaying { movieResponse, error in
            if error != nil {
                print("Somenting went wrong\(error?.localizedDescription)")
                return
            }
            if let response = movieResponse { // optional unwrapping para saber se tem dados
                 self.movies = response.movies
            }
        }
    }
}
