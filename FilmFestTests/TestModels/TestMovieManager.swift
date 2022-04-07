//
//  TestMovieManager.swift
//  FilmFestTests
//
//  Created by Omar Regalado on 05/04/22.
//  Copyright © 2022 Author. All rights reserved.
//

import XCTest

@testable import FilmFest
class TestMovieManager: XCTestCase {
    
    var sut: MovieManager!
    let marvelMovie = Movie(title: "Dr Strange")
    let documentalMovie = Movie(title: "The Last Dance")
    let actionMovie = Movie(title: "Back To The Future")

    override func setUp() {
        super.setUp()
        sut = MovieManager()
    }

    override func tearDown()  {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //MARK:- Initialization
    func testInit_MoviesToSee_ReturnZero() {
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testInit_MoviesSeen_ReturnZero() {
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    //MARK: Add & Query
    func testAdd_MoviesToSee_ReturnsOne() {
        sut.addMovie(movie: marvelMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    //Check a function that returns a value
    func testQuery_ReturnMovieAtIndex() {
        sut.addMovie(movie: actionMovie)
        
        let movieQueried = sut.movieAtIndex(index: 0)
        XCTAssertEqual(actionMovie.title, movieQueried.title)
    }
    
    
    //MARK: Checking off
    func testCheckOffMovie_UpdatesMovieManagerCounts() {
        sut.addMovie(movie: documentalMovie)
        sut.checkOffMoviesAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)
    }
    
    func testCheckOffMovie_RemovesMovieFromArray() {
        sut.addMovie(movie: actionMovie)
        sut.addMovie(movie: marvelMovie)
        sut.checkOffMoviesAtIndex(index: 0)
        
        XCTAssertEqual(sut.movieAtIndex(index: 0).title, marvelMovie.title)
    }
    
    func testCheckOffMovie_ReturnsMovieAtIndex() {
        sut.addMovie(movie: marvelMovie)
        sut.checkOffMoviesAtIndex(index: 0)
        
        let movieQueried = sut.checkedOffMovieAtIndex(index: 0)
        XCTAssertEqual(marvelMovie.title, movieQueried.title)
    }
    
    //MARK:- Equatable
    func testEquatable_ReturnsTrue() {
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Action")
        
        XCTAssertEqual(actionMovie1, actionMovie2)
    }
    
    func testEquatable_ReturnsNotEqualForDifferentTitles(){
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Adventure")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }
    
    func testEquatable_ReturnsNotEqualForDifferentReleaseDates() {
        let actionMovie1 = Movie(title: "Action", releaseDate: "2022")
        let actionMovie2 = Movie(title: "Action", releaseDate: "1990")
        
        XCTAssertNotEqual(actionMovie2, actionMovie1)
    }
    
    func testClearArrays_ReturnsArrayCountZero() {
        sut.addMovie(movie: marvelMovie)
        sut.addMovie(movie: actionMovie)
        sut.checkOffMoviesAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesSeenCount, 1)
        XCTAssertEqual(sut.moviesToSeeCount, 1)
        
        sut.clearArrays()
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    func testDuplicatedMovies_ShouldNotBeAdded() {
        sut.addMovie(movie: marvelMovie)
        sut.addMovie(movie: marvelMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
}
