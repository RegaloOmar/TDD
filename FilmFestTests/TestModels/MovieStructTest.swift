//
//  MovieStructTest.swift
//  FilmFestTests
//
//  Created by Omar Regalado on 05/04/22.
//  Copyright © 2022 Author. All rights reserved.
//

import XCTest
@testable import FilmFest

class MovieStructTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit_MovieWithTitle() {
        let testMovie = Movie(title: "Generic Action Movie")
        //Every test needs an assertion
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Generic Action Movie")
    }
    
    func testInit_MoviewWithTitleAndReleaseDate() {
        let testMovie = Movie(title: "Movie", releaseDate: "2022")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.releaseDate, "2022")
    }

}
