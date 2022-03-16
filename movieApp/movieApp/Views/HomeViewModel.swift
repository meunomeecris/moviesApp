//
//  HomeViewModel.swift
//  movieApp
//
//  Created by Cris Messias on 09/03/22.
//

import Foundation

//principio da responsabilidade
//ViewModel recebe e entrega dados (output)

class HomeViewModel: ObservableObject { //regra de negócios - comunica com outras camadas //permitir observação
    
    var movieService: MovieService = MovieService() //especificar o tipo
    @Published var movies: [Movie] = [] //array vazia
    //@Published - swiftui - acompanhar mudanças
    
    
    func getNowPlaying() { //função que pega os dados da requisição
        movieService.getNowPlaying { movieResponse, error in
            if error != nil {
                print("Somenting went wrong\(String(describing: error?.localizedDescription))")
                return //parar o código
            }
            if let response = movieResponse { // optional unwrapping para saber se tem dados. evitar que o app quebre
                self.movies = response.results
            }
        }
    }
}

