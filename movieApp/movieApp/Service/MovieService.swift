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
    private let apiKey: String = "4612d030c306c0e9b6e7ba7c40a2eb87" //the API Key
    
    
    func getNowPlaying(completion: @escaping (MovieResponse?, Error?) -> Void) { //completion é uma função executada dentro de outra função. executada depois da requisição
        
        let queryParameters: Parameters = ["api_key": apiKey]  //definição do método
        let completeURL: String = "\(baseURL)/movie/now_playing" //end point
        
        
        let request =  AF.request(completeURL, method: .get, parameters: queryParameters) //lugar na internet que vou buscar os dados
        
        request.responseDecodable { (response: DataResponse<MovieResponse, AFError>) in //tratando os dados tragos da requisição
            switch response.result {
            case .success(let result):
                completion(result, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
