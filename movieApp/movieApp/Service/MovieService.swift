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
    
    
    func getNowPlaying() { //completion é uma função executada dentro de outra função
        
        let queryParameters: Parameters = ["api_key": apiKey]  //definição do método
        let completeURL: String = "\(baseURL)/movie/now_playing"
        
        
        let request =  AF.request(completeURL, method: .get, parameters: queryParameters) //lugar na internet que vou buscar os dados
            
        request.responseDecodable { (response: DataResponse<MovieResponse, AFError>) in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
               print("Something went wrong \(error)")
            }
        }
    }
}


// func getNowPlaying(completion: @escaping (MovieResponse?, Error?) -> Void )

//        AF.request(completeURL, method: .get, parameters: queryParameters).responseDecodable {response: DataResponse<MovieResponse> in
//        switch response {
//        case .success:
//            completion(response.result, nil)
//        case .error(let error):
//            completion(response.result, nil)
//            }
