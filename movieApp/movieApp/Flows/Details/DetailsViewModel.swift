//
//  DetailsViewModel.swift
//  movieApp
//
//  Created by Cris Messias on 16/03/22.
//

import Foundation


//regra de negócios - comunica com outras camadas //permitir observação
//deve existir sem a View
//ViewModel pode ser base para várias views
//fazer test unitário so com viewModel

class DetailsViewModel: ObservableObject {

    var currentMovie: Movie
    
    init (detailsMovie: Movie) { //sobrescrever e mudar comportamento do metódo init
        self.currentMovie = detailsMovie //self  = deixar de abstrato / tornando independente
    }
}

