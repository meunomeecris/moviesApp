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
        imagePoster(viewModel: viewModel)
            .overlay(
                VStack(alignment: .center){
                    Text(viewModel.currentMovie.title)
                        .font(.largeTitle)
                        .bold()
                        .padding(6)
                        .foregroundColor(.white)
                        .padding(.bottom, 20)
                    
                    HStack{
                        HStack{
                            Image(systemName: "hand.thumbsup.circle.fill")
                                .foregroundColor(Color.white)
                            Text("\(viewModel.currentMovie.voteAverage)")
                                .foregroundColor(Color.white)
                        }
                        HStack{
                            Image(systemName: "suit.heart.fill")
                                .foregroundColor(Color.white)
                            Text("\(viewModel.currentMovie.voteCount)")
                                .foregroundColor(Color.white)
                        }
                    }
                    
                    .padding(.bottom, 20)
                    Text(viewModel.currentMovie.overview)
                        .font(.title3)
                        .foregroundColor(Color.white)
                        .padding()
                    
                }//end the ZStack
                ,alignment: .bottom) //end overlay
    } //end the body View
} //end the DetailsView 



struct imagePoster: View {
    @ObservedObject var viewModel: DetailsViewModel  //passar como parametro - não está concreta - sem instancia
    
    var body: some View {
        AsyncImage(url: URL(string: viewModel.currentMovie.completePosterPath)) { movie in
            if let image = movie.image {
                image.resizable() // Displays the loaded image.
            } else if movie.error != nil {
                Color.red // Indicates an error.
            } else {
                Color.blue // Acts as a placeholder.
            }
        }
        .ignoresSafeArea()
    }
}

//
//struct DetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsView(viewModel: DetailsViewModel(detailsMovie: Movie(from:  JSONDecoder() as! Decoder)))//init: reservar espaço na memória // passar vários parametros
//
//    }
//}
