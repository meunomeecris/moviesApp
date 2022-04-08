//
//  Bundle+Extensions.swift
//  movieApp
//
//  Created by Cris Messias on 08/04/22.
//

import Foundation

extension Bundle {
    
    func loadFromBundle(resourceName: String, ext: String = "json") -> Data {
        guard let url = self.url(forResource: resourceName, withExtension: ext),
              let data = try? Data(contentsOf: url, options: .alwaysMapped) else {
            return Data()
        }
        return data
    }
}
