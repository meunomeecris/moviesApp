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
                imagePoster(viewModel: viewModel)
            .overlay(
                VStack(alignment: .center){
                    Text(viewModel.currentMovie.title)
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom, 8)
                    
                    HStack{
                        HStack{
                            Image(systemName: "hand.thumbsup.circle.fill")
                            Text(String(format: "%.2f", viewModel.currentMovie.voteAverage))
                                
                        }//end the HStack
                    
                        HStack{
                            Image(systemName: "suit.heart.fill")
                            Text("\(viewModel.currentMovie.voteCount)")
                                .multilineTextAlignment(.center)
                        }//end the HStack
                    }//end the HStack
                    .padding(.bottom, 16)
                    
                    Button(action: {
                        viewModel.videoService.getVideo(movieID: viewModel.currentMovie.id) { videoResponse, error in
                            let youtubeResults = videoResponse?.results.filter({ result in result.site == "YouTube" })
                            let finalYoutubeResult = youtubeResults?.first
                            print("https://www.youtube.com/watch?v=\(finalYoutubeResult!.key)")
                        }
                    }, label: {
                        Text("Trailer")
                    })
                    
                    Text(viewModel.currentMovie.overview)
                        .font(.body)
                    
                }//end the VStack
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.white)
                    .padding()
                    .padding(.vertical, 24)
                    .background(
                        RoundedCornersShape(corners: [.topLeft, .topRight], radius: 24)
                    )
                ,alignment: .bottom)//end overlay
            .ignoresSafeArea(.all)
        } //end the ZStack
    } //end the body View
} //end the DetailsView 


struct imagePoster: View {
    @ObservedObject var viewModel: DetailsViewModel  //passar como parametro - não está concreta - sem instancia
    
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


//struct DetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsView(viewModel: DetailsViewModel(detailsMovie: Movie(from:  JSONDecoder() as! Decoder)))//init: reservar espaço na memória // passar vários parametros
//
//    }
//}
