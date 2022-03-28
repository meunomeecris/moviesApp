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
    
    private var videoService: VideoService = VideoService()
    var currentMovie: Movie
    var currentYoutubeAddress: String = ""
    
    init (detailsMovie: Movie) { //sobrescrever e mudar comportamento do metódo init
        self.currentMovie = detailsMovie //self  = deixar de abstrato / tornando independente
    }
    
    
    //    viewModel.videoService.getVideo(movieID: viewModel.currentMovie.id) { videoResponse, error in
    //        let youtubeResults = videoResponse?.results.filter({ result in result.site == "YouTube" })
    //        let finalYoutubeResult = youtubeResults?.first
    //        print("https://www.youtube.com/watch?v=\(finalYoutubeResult!.key)")
    //    }
    
    //encapsulamento
    func getMovieTrailer(_ movie: Movie, completion: @escaping (String) -> Void ) { //call back
        self.videoService.getVideo(movieID: movie.id) { videoResponse, error in
            if error != nil {
                print("Something went wrong \(error?.localizedDescription ?? "")") //nil coalescing
            }
            
            let youtubeResults = videoResponse?.results.filter({ result in result.site == "YouTube" })
            guard let finalYoutubeResult = youtubeResults?.first else { //filtrar os optionals
                return
            }
            
            let youtubeAddress: String = "https://www.youtube.com/watch?v=\(finalYoutubeResult.key)"
            completion(youtubeAddress)
        }
    }
}



