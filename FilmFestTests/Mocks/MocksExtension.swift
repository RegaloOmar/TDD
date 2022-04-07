//
//  MocksExtension.swift
//  FilmFestTests
//
//  Created by Omar Regalado on 06/04/22.
//  Copyright © 2022 Author. All rights reserved.
//

import Foundation
import UIKit

@testable import FilmFest
extension MovieLibraryDataServiceTest {
    
    class TableViewMock: UITableView {
        var cellDequedProperly = false
        
        class func initMock(dataSource: MovieLibraryDataService) -> TableViewMock {
            let mock = TableViewMock(frame: CGRect.init(x: 0, y: 0, width: 300, height: 500), style: .plain)
            mock.dataSource = dataSource
            mock.register(MovieCellMock.self, forCellReuseIdentifier: "movieCellID")
            
            return mock
        }
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequedProperly = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MovieCellMock: MovieCell {

        var movieData: Movie?
        
        override func configMovieCell(movie: Movie) {
            movieData = movie
        }
    }
    
}


extension MovieCellTest {
    
    class MockCellDataSource: NSObject, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
        
        
    }
}


