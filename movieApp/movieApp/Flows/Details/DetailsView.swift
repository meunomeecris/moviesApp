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
        ZStack{
            ImagePoster(viewModel: viewModel)
                .overlay(
                    VStack(){
                        TitleMovie(viewModel: viewModel)
                        HStack{
                            AverageButton(viewModel: viewModel)
                            VoteCountButton(viewModel: viewModel)
                        }
                        .padding(.bottom, 16)
                        HStack{
                            TrailerButton(viewModel: viewModel)
                            FavoriteButton(viewModel: viewModel)
                        }
                        .padding(.bottom,16)
                        Text(viewModel.currentMovie.overview)
                            .font(.body)
                            .padding(.bottom,24)
                    }
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(.systemGray6))
                        .padding()
                        .padding(.horizontal, 16)
                        .background(
                            RoundedCornersShape(corners: [.topLeft, .topRight], radius: 24)
                        )
                    ,alignment: .bottom)//end overlay
        } //end the ZStack
        .ignoresSafeArea(.all)
        .onAppear{
           let _ = viewModel.isMovieFavorite(movie: viewModel.currentMovie) 
        }
    } //end the body View
} //end the DetailsView 








