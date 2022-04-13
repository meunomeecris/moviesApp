//
//  KeychainService.swift
//  movieApp
//
//  Created by Cris Messias on 13/04/22.
//

import Foundation
import KeychainSwift

class KeychainService: KeychainStorageType {
    
    private let keychain: KeychainSwift = KeychainSwift()
    
    func saveContent(text: String, key: String) -> Bool {
       return keychain.set(text, forKey: key)
    }
    
    func loadContent(key: String) -> String? {
        return keychain.get(key)
    }
    
    func deleteContent(key: String) -> Bool {
        return keychain.delete(key)
    }
    
    
}
