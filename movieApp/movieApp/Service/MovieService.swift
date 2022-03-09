//
//  model.swift
//  movieApp
//
//  Created by Cris Messias on 25/02/22.
//

import Foundation
import Alamofire


class MovieService {
    
    private let baseURL: String  = "https://api.themoviedb.org/3" //a base da URL que não muda
    private let apiKey: String = "4612d030c306c0e9b6e7ba7c40a2eb87"
    
    
    func nowPlaying(completion: (MovieResponse?, Error?) -> Void ) {     //completion é uma função executada dentro de outra função
       
        var queryParameters: Parameters = ["api_key": apiKey]  //definição do método
        var completeURL: String = "\(baseURL)/movie/now_playing"
        
        AF.request(completeURL, method: .get, parameters: queryParameters).responseDecodable {response: DataResponse<MovieResponse> in
            
            switch response {
            case .success:
                completion(response.result, nil)
            case .error(let error):
                completion(nil, error)
            }
        }
    }
}
