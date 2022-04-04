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
    
    private var videoService: VideoServiceType = TheMoviedbVideoService()
    var currentMovie: Movie
    var currentYoutubeAddress: String = ""
    var favoriteService: FavoriteType = UserDefaultsFavoriteService()
    @Published var isFavorite: Bool = false
    
    init (detailsMovie: Movie) { //sobrescrever e mudar comportamento do metódo init
        self.currentMovie = detailsMovie //self  = deixar de abstrato / tornando independente
    }
    
    
    // MARK: - Movie trailer
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
    
    
    // MARK: - Favorite movies
    func isMovieFavorite(movie: Movie) -> Bool { //evitar metodos ninjas (nao recebe nem envia parametros)
        let isFav =  favoriteService.isFavorited(movie: movie)
        self.isFavorite = isFav
        return isFav
    }
    
    func handleFavorite(movie: Movie) {
        if self.isMovieFavorite(movie: movie) {
            favoriteService.removeFromFavorite(movie: movie)
        } else {
            favoriteService.addToFavorite(movie: movie)
        }
        let _ = isMovieFavorite(movie: currentMovie)
    }
}



