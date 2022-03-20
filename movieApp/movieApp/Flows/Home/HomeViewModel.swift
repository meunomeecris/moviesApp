//
//  HomeViewModel.swift
//  movieApp
//
//  Created by Cris Messias on 09/03/22.
//

import Foundation
import SwiftUI
//principio da responsabilidade
//ViewModel recebe e entrega dados (output)

class HomeViewModel: ObservableObject { //regra de negócios - comunica com outras camadas //permitir observação
    
    var movieService: MovieService = MovieService() //especificar o tipo
    @Published var movies: [Movie] = [] //array vazia
    //@Published - swiftui - acompanhar mudanças
    @State var searchText = ""
    
    
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
    
    
    func searchResults() -> [Movie] {
        if searchText.isEmpty {
            return HomeViewModel().movies
        } else {
            return HomeViewModel().movies.filter {
                $0.title
                .localizedCaseInsensitiveContains(searchText)}
        }
    }
}




