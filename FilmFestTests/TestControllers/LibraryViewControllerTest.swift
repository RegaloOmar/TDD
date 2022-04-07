//
//  LibraryViewControllerTest.swift
//  FilmFestTests
//
//  Created by Omar Regalado on 06/04/22.
//  Copyright © 2022 Author. All rights reserved.
//

import XCTest

@testable import FilmFest
class LibraryViewControllerTest: XCTestCase {

    var sut: LibraryViewController!
    
    override func setUp() {
        super.setUp()
        
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as? LibraryViewController
        
        _ = sut.view
    }

    override func tearDown() {
        super.tearDown()
    }
    
    //MARK:- NIL CHECK
    //Check components are not nil
    
    func testLibraryVC_TableViewShouldNotBeNil() {
        XCTAssertNotNil(sut.libraryTableView)
    }
    
    //MARK:- Datasource
    
    func testDataSource_ViewDidLoad_SetsTableViewDataSource() {
        XCTAssertNotNil(sut.libraryTableView.dataSource)
        XCTAssertTrue(sut.libraryTableView.dataSource is MovieLibraryDataService)
    }
    
    //MARK:- Delegate
    func testDelegate_ViewDidLoad_SetsTableViewDelegateSource() {
        XCTAssertNotNil(sut.libraryTableView.delegate)
        XCTAssertTrue(sut.libraryTableView.delegate is MovieLibraryDataService)
    }
    
    //MARK:- Data service assumptions
    func testDataService_ViewDidLoad_SingleDataServiceObject() {
        //Check if Delgate and DS is equal
        XCTAssertEqual(sut.libraryTableView.delegate as! MovieLibraryDataService, sut.libraryTableView.dataSource as! MovieLibraryDataService)
    }

}
