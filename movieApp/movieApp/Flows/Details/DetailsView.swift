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
                            Average(viewModel: viewModel)
                            VoteCount(viewModel: viewModel)
                        }
                        .padding(.bottom, 16)
                        HStack{
                            TrailerButton(viewModel: viewModel)
                            FavoriteButton()
                        }
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
                .ignoresSafeArea(.all)
        } //end the ZStack
    } //end the body View
} //end the DetailsView 

// MARK: - ImagePoster
struct ImagePoster: View {
    @ObservedObject var viewModel: DetailsViewModel  
    
    var body: some View {
        AsyncImage(url: URL(string: viewModel.currentMovie.completePosterPath)) { movie in
            if let image = movie.image {
                image.resizable()// Displays the loaded image.
            } else if movie.error != nil {
                Color.red // Indicates an error.
            } else {
                Color.blue // Acts as a placeholder.
            }
        }
    }
}

// MARK: - RoundedCornersShape
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

// MARK: - TitleMovie
struct TitleMovie: View {
    @ObservedObject var viewModel: DetailsViewModel
    var body: some View {
        Text(viewModel.currentMovie.title)
            .font(.largeTitle)
            .bold()
            .padding(.bottom, 8)
    }
}

// MARK: - Average
struct Average: View {
    @ObservedObject var viewModel: DetailsViewModel
    var body: some View {
        HStack{
            Image(systemName: "hand.thumbsup.circle.fill")
            Text(String(format: "%.2f", viewModel.currentMovie.voteAverage))
        }
    }
}

// MARK: - VoteCount
struct VoteCount: View {
    @ObservedObject var viewModel: DetailsViewModel
    var body: some View {
        HStack{
            Image(systemName: "suit.heart.fill")
            Text("\(viewModel.currentMovie.voteCount)")
        }
    }
}

// MARK: - TrailerButton
struct TrailerButton: View {
    @ObservedObject var viewModel: DetailsViewModel
    @State var isShowingPlayerView: Bool = false
    
    var body: some View{
        Button(action: {
            viewModel.getMovieTrailer(viewModel.currentMovie) { youtubeAddress in
                viewModel.currentYoutubeAddress = youtubeAddress //
                isShowingPlayerView.toggle()
            }
        }
               , label: {
            Text("Trailer")
                .font(.callout)
                .foregroundColor(.white)
                .padding()
                .background(Color(.systemRed))
                .cornerRadius(40)
        })
            .padding(.bottom,16)
            .sheet(isPresented: $isShowingPlayerView){
                YTPlayerView(urlString: viewModel.currentYoutubeAddress)
            }
    }
}

struct FavoriteButton: View {
    var body: some View {
        
        Button {
            
        } label: {
            
        }
        
    }
    
    var favoriteTrue: some View {
        Text("Favorite")
            .font(.callout)
            .foregroundColor(.white)
            .padding()
            .background(Color(.systemGray))
            .cornerRadius(40)
    }
    
    var favoriteFalse: some View{
        Text("Favorite")
            .font(.callout)
            .foregroundColor(.white)
            .padding()
            .background(Color(.systemGreen))
            .cornerRadius(40)
        
    }
}
