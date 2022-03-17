//
//  DetailsView.swift
//  movieApp
//
//  Created by Cris Messias on 16/03/22.
//

import SwiftUI

//View precisa de uma ViewModel

struct DetailsView: View {
    @ObservedObject var viewModel: DetailsViewModel  //passar como parametro - não está concreta - sem instancia
    
    var body: some View {
        Text(viewModel.currentMovie.title)
    }
}





//struct DetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//  DetailsView(viewModel: DetailsViewModel(movie: Movie(from: JSONDecoder() as! Decoder)))//init: reservar espaço na memória // passar vários parametros
//
//    }
//}
