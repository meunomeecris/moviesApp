//
//  VideoViewModel.swift
//  movieApp
//
//  Created by Cris Messias on 23/03/22.
//

import Foundation

class VideoViewModel: ObservableObject { //regra de negócios - comunica com outras camadas //permitir observação
    
    var videoService: VideoService = VideoService() //especificar o tipo
    @Published var link: [String : Result]?//Int Vazia //@Published - swiftui - acompanhar mudanças
    @Published var searchText = ""
    
    
    func getVideo() { //função que pega os dados da requisição
        videoService.getVideo { videoResponse, error in
            if error != nil {
                print("Somenting went wrong\(String(describing: error?.localizedDescription))")
                return //parar o código
            }
            if let response = videoResponse { // optional unwrapping para saber se tem dados. evitar que o app quebre
                self.link = response.results 
            }
        }
    }
}

