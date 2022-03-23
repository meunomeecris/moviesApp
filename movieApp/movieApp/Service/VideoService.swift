//
//  VideoService.swift
//  movieApp
//
//  Created by Cris Messias on 23/03/22.
//

import Foundation
import Alamofire

//https://api.themoviedb.org/3/movie/508947/watch/providers?api_key=4612d030c306c0e9b6e7ba7c40a2eb87
//https://api.themoviedb.org/3/movie/{movie_id}/watch/providers
//    /movie/{movie_id}/watch/providers

class VideoService {
    
    private let baseURLVideo: String  = "https://api.themoviedb.org/3/movie" //a base da URL que não muda
    private let apiKey: String = "4612d030c306c0e9b6e7ba7c40a2eb87" //the API Key
    
    func getVideo(completion: @escaping (VideoResponse?, Error?) -> Void) {
        
        let movieID: Int = 508947
        let queryParameters: Parameters = ["api_key": apiKey]  //definição do método
        let completeURL: String = "\(baseURLVideo)/\(movieID)/watch/providers" //end point
        
        let request = AF.request(completeURL, method: .get, parameters: queryParameters)
        
        request.responseDecodable { (response: DataResponse<VideoResponse, AFError>) in
            switch response.result {
            case .success(let result):
                print("result: \(result) ")
                completion(result,nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
