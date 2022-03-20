//
//  DetailsView.swift
//  movieApp
//
//  Created by Cris Messias on 16/03/22.
//

import SwiftUI
import UIKit

//View precisa de uma ViewModel

struct DetailsView: View {
    @ObservedObject var viewModel: DetailsViewModel  //passar como parametro - não está concreta - sem instancia
    
    var body: some View {
        imagePoster(viewModel: viewModel)
            .overlay(
                VStack{
                    Text(viewModel.currentMovie.title)
                        .font(.largeTitle)
                        .bold()
                        .padding(6)
                        .foregroundColor(.white)
                        .padding(.bottom, 10)
                        .opacity(1)
                    
                    HStack{
                        HStack{
                            Image(systemName: "hand.thumbsup.circle.fill")
                                .foregroundColor(Color.white)
                            Text(String(format: "%.2f", viewModel.currentMovie.voteAverage))
                                .foregroundColor(Color.white)
                        }
                        HStack{
                            Image(systemName: "suit.heart.fill")
                                .foregroundColor(Color.white)
                            Text("\(viewModel.currentMovie.voteCount)")
                                .foregroundColor(Color.white)
                        }
                    }
                    .opacity(1)
                    .padding(.bottom, 16)
                    
                    Text(viewModel.currentMovie.overview)
                        .font(.body)
                        .foregroundColor(Color.white)
                        .padding()
                }//end the VStack
                    .padding(20)
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    .background(
                        RoundedCornersShape(corners: [.topLeft, .topRight], radius: 25)
                    )
                ,alignment: .bottom)//end overlay
            .ignoresSafeArea(.all)
    } //end the body View
} //end the DetailsView 


struct RoundedCornersShape: Shape {
    let corners: UIRectCorner
    let radius: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
     
}


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


//struct DetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsView(viewModel: DetailsViewModel(detailsMovie: Movie(from:  JSONDecoder() as! Decoder)))//init: reservar espaço na memória // passar vários parametros
//
//    }
//}
