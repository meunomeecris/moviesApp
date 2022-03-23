//
//  VideoResponse.swift
//  movieApp
//
//  Created by Cris Messias on 23/03/22.
//

import Foundation

// MARK: - Welcome
struct VideoResponse: Codable {
    let id: Int
    let results: [String: Result]
}

// MARK: - Result
struct Result: Codable {
    let link: String
    let flatrate: [Flatrate]
}

// MARK: - Flatrate
struct Flatrate: Codable {
    let displayPriority: Int
    let logoPath: LogoPath
    let providerID: Int
    let providerName: ProviderName

    enum CodingKeys: String, CodingKey {
        case displayPriority = "display_priority"
        case logoPath = "logo_path"
        case providerID = "provider_id"
        case providerName = "provider_name"
    }
}

enum LogoPath: String, Codable {
    case o6Li3XZrBKXSqyNRS39UQEfPTCHJpg = "/o6li3XZrBKXSqyNRS39UQEfPTCH.jpg"
    case the7Fl8YlPDclt3ZYgNbW2T7RbZE9IJpg = "/7Fl8ylPDclt3ZYgNbW2t7rbZE9I.jpg"
    case the7RwgEs15TFwyR9NPQ5VpzxTj19QJpg = "/7rwgEs15tFwyR9NPQ5vpzxTj19Q.jpg"
}

enum ProviderName: String, Codable {
    case disneyPlus = "Disney Plus"
    case hotstar = "Hotstar"
    case virginTVGo = "Virgin TV Go"
}

