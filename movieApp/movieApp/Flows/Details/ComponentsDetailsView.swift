//
//  ComponentsHomeView.swift
//  movieApp
//
//  Created by Cris Messias on 31/03/22.
//

import SwiftUI
import CoreMedia

struct ComponentsDetailsView: View {
    @ObservedObject var viewModel: DetailsViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)

    }
}

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
                                cornerRadii: CGSize(width: radius, height: radius)
                                )
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

struct AverageButton: View {
    @ObservedObject var viewModel: DetailsViewModel
    var body: some View {
        HStack{
            Image(systemName: "hand.thumbsup.circle.fill")
            Text(String(format: "%.2f", viewModel.currentMovie.voteAverage))
        }
    }
}

// MARK: - VoteCount
struct VoteCountButton: View {
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
            HStack{
                Image(systemName: "eye")
                Text("Trailer")
            }
                .font(.callout)
                .foregroundColor(Color("LightMode"))
                .padding(10)
                .padding(.horizontal, 10)
                .background(Color("DarkMode"))
                .cornerRadius(40)
        })
        .sheet(isPresented: $isShowingPlayerView){
            YTPlayerView(urlString: viewModel.currentYoutubeAddress)
        }
    }
}

// MARK: - FavoriteButton
struct FavoriteButton: View {
    @ObservedObject var viewModel: DetailsViewModel
    
    var body: some View {
        Button (action: {
            viewModel.handleFavorite(movie: viewModel.currentMovie)
        }, label: {
            HStack{
                Image(systemName: "star")
                Text("Favorite")
            }
                .font(.callout)
                .foregroundColor(viewModel.isFavorite ? Color(.white) : Color(.systemGray))
                .padding(10)
                .padding(.horizontal, 10)
                .background(viewModel.isFavorite ? Color(.systemGreen) : Color(.systemGray6))
                .cornerRadius(40)
        })
    }
}
