//
//  FavoriteServiceTests.swift
//  movieAppTests
//
//  Created by Cris Messias on 08/04/22.
//

import XCTest
@testable import movieApp

class FavoriteServiceTests: XCTestCase {
    //override - sobrescrever o método
    //setUp - antes do Teste Unitário
    //tearDown - depois do Teste Unitário

    
    func testAddFavorite() {
        do {
            let favoriteService: FavoriteType = UserDefaultsFavoriteService()
            let bundle = Bundle(for: Self.self)
            let data = bundle.loadFromBundle(resourceName: "moviesMock")
            let mockMovies = try JSONDecoder().decode([Movie].self, from: data)
            favoriteService.addToFavorite(movie: mockMovies.first!)
            let resultCount = favoriteService.getFavorites().count
            XCTAssertEqual(resultCount, 1)
        } catch let error {
            XCTFail("\(error.localizedDescription)")
        }
        
    }
}
