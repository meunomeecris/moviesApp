//
//  AccessTokenService.swift
//  movieApp
//
//  Created by Cris Messias on 27/04/22.
//

import Foundation


struct AccessTokenKeys{
    static let accessToken: String = "access_token"
}


protocol  AccessTokenServiceType {
    func loadAccessToken() -> UserSession?
    func saveAccessToken(value: String) -> Bool
    func deleteAccessToken() -> Bool
}


class AccessTokenService: AccessTokenServiceType {
    
    private var keychainService: KeychainStorageType
    
    //injeção de depedências neste caso para usar o mocks
    init(keychainService: KeychainStorageType) {
        self.keychainService = keychainService
    }
    
    
    func loadAccessToken() -> UserSession? {
        //caminho para acessar a informação armazenada dentro do Keychain do dispositvo
        if let token = keychainService.loadContent(key: AccessTokenKeys.accessToken) {
            return UserSession(token: token)
        } else {
            return nil
        }
    }
    
    func saveAccessToken(value: String) -> Bool {
        //guardando dados
       return keychainService.saveContent(text: value , key: AccessTokenKeys.accessToken)
    }
    
    func deleteAccessToken() -> Bool {
        return keychainService.deleteContent(key: AccessTokenKeys.accessToken)
    }
}
