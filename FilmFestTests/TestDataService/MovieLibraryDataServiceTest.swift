//
//  MovieLibraryDataServiceTest.swift
//  FilmFestTests
//
//  Created by Omar Regalado on 06/04/22.
//  Copyright © 2022 Author. All rights reserved.
//

import XCTest

@testable import FilmFest
class MovieLibraryDataServiceTest: XCTestCase {
    
    var sut: MovieLibraryDataService!
    var libraryTableView: UITableView!
    var libraryVC: LibraryViewController!
    var tableViewMock: TableViewMock!
    
    let fairyTale = Movie(title: "Fairy Tale")
    let thriller = Movie(title: "Thriller")
    let drStrange = Movie(title: "Dr Strange")

    override func setUp()  {
        super.setUp()
        libraryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as? LibraryViewController
        _ = libraryVC.view
        
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        
        libraryTableView = libraryVC.libraryTableView
        libraryTableView.dataSource = sut
        libraryTableView.delegate = sut
        tableViewMock = TableViewMock.initMock(dataSource: sut)
    }

    override func tearDown()  {
        super.tearDown()
    }
    
    func testTableView_SectionCount_ReturnsTwo() {
        let sections = libraryTableView.numberOfSections
        XCTAssertEqual(sections, 2)
    }
    
    func testTableViewSection_SectionOne_ReturnsMoviesToSeeCount() {
        sut.movieManager?.addMovie(movie: drStrange)
        sut.movieManager?.addMovie(movie: thriller)
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 2)
        
        sut.movieManager?.addMovie(movie: fairyTale)
        libraryTableView.reloadData()
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 3)
    }
    
    func testTableViewSection_SectionTwo_ReturnsMoviesSeenCount() {
        sut.movieManager?.addMovie(movie: thriller)
        sut.movieManager?.addMovie(movie: fairyTale)
        sut.movieManager?.checkOffMoviesAtIndex(index: 0)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
        
        sut.movieManager?.checkOffMoviesAtIndex(index: 0)
        libraryTableView.reloadData()
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 2)
    }
    
    //MARK:- Cells
    func testCell_RowAtIndez_ReturnMovieCell() {
        sut.movieManager?.addMovie(movie: drStrange)
        libraryTableView.reloadData()
        
        let cellQueried = libraryTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cellQueried is MovieCell)
    }
    
    func testCell_ShouldDequeCell() {
        
        sut.movieManager?.addMovie(movie: drStrange)
        tableViewMock.reloadData()
        _ = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(tableViewMock.cellDequedProperly)
    }
    
    func testCell_SectionOneConfig_ShouldSetCellData() {
        
        sut.movieManager?.addMovie(movie: fairyTale)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieCellMock
        XCTAssertEqual(cell.movieData, fairyTale)
        
    }
    
    func testCell_SectionTwoConfig_ShouldSetCellData() {
        sut.movieManager?.addMovie(movie: drStrange)
        sut.movieManager?.addMovie(movie: fairyTale)
        sut.movieManager?.checkOffMoviesAtIndex(index: 0)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 1)) as! MovieCellMock
        
        XCTAssertEqual(cell.movieData, drStrange)
        
    }
    
    func testCell_Selection_ShouldCheckOffSelectedMovie() {
        sut.movieManager?.addMovie(movie: fairyTale)
        sut.movieManager?.addMovie(movie: drStrange)
        libraryTableView.delegate?.tableView?(libraryTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(sut.movieManager?.moviesToSeeCount, 1)
        XCTAssertEqual(sut.movieManager?.moviesSeenCount, 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
    }
    
    func testTableViewSectionTitles() {
        
        let section1Title = libraryTableView.dataSource?.tableView?(libraryTableView, titleForHeaderInSection: 0)
        let section2Title = libraryTableView.dataSource?.tableView?(libraryTableView, titleForHeaderInSection: 1)
        
        XCTAssertEqual(section1Title, "Movies To See")
        XCTAssertEqual(section2Title, "Movies Seen")
    }

}
