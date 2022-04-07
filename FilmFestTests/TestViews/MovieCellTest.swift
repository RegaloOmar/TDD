//
//  MovieCellTest.swift
//  FilmFestTests
//
//  Created by Omar Regalado on 06/04/22.
//  Copyright © 2022 Author. All rights reserved.
//

import XCTest

@testable import FilmFest
class MovieCellTest: XCTestCase {
    
    var tableView: UITableView!
    var mockDataSource: MockCellDataSource!

    override func setUp()  {
        super.setUp()
        
        let libraryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as! LibraryViewController
        _ = libraryVC.view
        
        tableView = libraryVC.libraryTableView
        mockDataSource = MockCellDataSource()
        tableView.dataSource = mockDataSource
        
    }

    override func tearDown()  {
        super.tearDown()
    }

    func testCell_Config_ShouldSetLabelsToMovieData() {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellID", for: IndexPath(row: 0, section: 0)) as! MovieCell
        cell.configMovieCell(movie: Movie(title: "Comedy", releaseDate: "2022"))
        
        XCTAssertEqual(cell.textLabel?.text, "Comedy")
        XCTAssertEqual(cell.detailTextLabel?.text, "2022")
        
    }
}
