//
//  FavoriteServiceTests.swift
//  movieAppTests
//
//  Created by Cris Messias on 08/04/22.
//

import XCTest
@testable import movieApp

class FavoriteServiceTests: XCTestCase {
    static let testKey: String = "unitTest"
    
    override func tearDown() {
        UserDefaults.standard.removeObject(forKey: FavoriteServiceTests.testKey)
    }
    
    func testAddFavorite() {
        do {
            let favoriteService = UserDefaultsFavoriteService(userDefaultsKey: FavoriteServiceTests.testKey)
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
    
    func testIsFavorited() {
        do {
            let favoriteService = UserDefaultsFavoriteService(userDefaultsKey: FavoriteServiceTests.testKey)
            let bundle = Bundle(for: Self.self)
            let data = bundle.loadFromBundle(resourceName: "moviesMock")
            let mockMovies = try JSONDecoder().decode([Movie].self, from: data)
            favoriteService.addToFavorite(movie: mockMovies.first!)
            let resultFavorite = favoriteService.isFavorited(movie: mockMovies.first!)
            XCTAssertEqual(resultFavorite,  true)
        } catch let error {
            XCTFail("\(error.localizedDescription)")
        }
    }
    
    func testIsNotFavorited() {
        do {
            let favoriteService = UserDefaultsFavoriteService(userDefaultsKey: FavoriteServiceTests.testKey)
            let bundle = Bundle(for: Self.self)
            let data = bundle.loadFromBundle(resourceName: "moviesMock")
            let mockMovies = try JSONDecoder().decode([Movie].self, from: data)
            favoriteService.addToFavorite(movie: mockMovies[2])
            let result = favoriteService.isFavorited(movie: mockMovies.first!)
            XCTAssertEqual(result,  false)
        } catch let error {
            XCTFail("\(error.localizedDescription)")
        }
    }
    
    func testIsRemoved(){
        do {
            let favoriteService = UserDefaultsFavoriteService(userDefaultsKey: FavoriteServiceTests.testKey)
            let bundle = Bundle(for: Self.self)
            let data = bundle.loadFromBundle(resourceName: "moviesMock")
            let mockMovies = try JSONDecoder().decode([Movie].self, from: data)
            favoriteService.addToFavorite(movie: mockMovies.first!)
            favoriteService.removeFromFavorite(movie: mockMovies.first!)
            let resultCount = favoriteService.getFavorites().count
            XCTAssertEqual(resultCount, 0)
        } catch let error {
            XCTFail("\(error.localizedDescription)")
        }
        
    }

    
}

//override - sobrescrever o m??todo
//setUp - antes do Teste Unit??rio
//tearDown - depois do Teste Unit??rio
