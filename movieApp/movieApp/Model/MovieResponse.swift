//
//  MovieResponse.swift
//  movieApp
//
//  Created by Cris Messias on 08/03/22.
//

import Foundation



// MARK: - MovieResponse
struct MovieResponse: Codable {
    let page: Int
    let movies: [Movie]
    let totalPages: Int
    let totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page
        case movies
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}



// MARK: - Result
struct Movie: Codable, Identifiable {
    let adult: Bool
    let backdropPath: String
    let id: Int
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath, releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

