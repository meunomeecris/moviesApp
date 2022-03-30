//
//  VideoService.swift
//  movieApp
//
//  Created by Cris Messias on 23/03/22.
//

import Foundation
import Alamofire

typealias VideoCompletion = (VideoResponse?, Error?) -> Void

//Definição do tipo
protocol VideoServiceType {
    func getVideo(movieID: Int, completion: @escaping VideoCompletion)
}

//Possivel Implementação
class TheMoviedbVideoService: VideoServiceType {
    
    private let baseURLVideo: String  = "https://api.themoviedb.org/3/movie" //a base da URL que não muda
    private let apiKey: String = "4612d030c306c0e9b6e7ba7c40a2eb87" //the API Key
    
    func getVideo(movieID: Int, completion: @escaping VideoCompletion) {
        
        let queryParameters: Parameters = ["api_key": apiKey]  //definição do método
        let completeURL: String = "\(baseURLVideo)/\(movieID)/videos" //end point
        
        let request = AF.request(completeURL, method: .get, parameters: queryParameters)
        
        request.responseDecodable { (response: DataResponse<VideoResponse, AFError>) in
            switch response.result {
            case .success(let result):
                completion(result,nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}

//https://api.themoviedb.org/3/movie/508947/videos?api_key=4612d030c306c0e9b6e7ba7c40a2eb87&language=en-US
//https://api.themoviedb.org/3/movie/{movie_id}/videos?api_key=<<api_key>>&language=en-US
// /movie/{movie_id}/videos
