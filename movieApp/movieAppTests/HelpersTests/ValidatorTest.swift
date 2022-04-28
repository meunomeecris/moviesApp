//
//  ValidatorTest.swift
//  movieAppTests
//
//  Created by Cris Messias on 14/04/22.
//

import XCTest
@testable import movieApp

class ValidatorTest: XCTestCase {

    func testEmailValidatorSuccess() {
        let email = "cris.dias@gmail.com"
        let result = Validator.validateEmail(email: email)
        XCTAssertEqual(result, .valid)
    }
    
    func testEmailValidatorError() {
        let email = "cris.diasgmail.com"
        let result = Validator.validateEmail(email: email)
        XCTAssertEqual(result, .invalid)
    }
    
    func testEmailEmpty() {
        let email = ""
        let result =  Validator.validateEmail(email: email)
        XCTAssertEqual(result, .initial)
    }
    
    
    //MARK: - Password Validator Test
    
    
}
