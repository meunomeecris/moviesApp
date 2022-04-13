//
//  KeychainStorageType.swift
//  movieApp
//
//  Created by Cris Messias on 13/04/22.
//

import Foundation

protocol KeychainStorageType { // Keychain só aceita string
    func saveContent(text: String, key: String) -> Bool
    func loadContent(key: String) -> String?
    func deleteContent(key: String) -> Bool
}
