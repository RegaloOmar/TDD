//
//  MovieLibraryDataService.swift
//  FilmFest
//
//  Created by Omar Regalado on 06/04/22.
//  Copyright © 2022 Author. All rights reserved.
//

import UIKit

enum LibrarySection: Int {
    case moviesToSee, MoviesSeen
}

class MovieLibraryDataService: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var movieManager: MovieManager?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let movieManager = movieManager else { return 0 }
        
        guard let librarySection = LibrarySection(rawValue: section) else { fatalError() }
        
        switch librarySection {
        case .moviesToSee:
            return movieManager.moviesToSeeCount
        case .MoviesSeen:
            return movieManager.moviesSeenCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let movieManager = movieManager else { fatalError() }
        guard let libraySection = LibrarySection(rawValue: indexPath.section) else {
            fatalError()
        }

        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellID", for: indexPath) as! MovieCell
        
        let movieData = libraySection.rawValue == 0 ? movieManager.movieAtIndex(index: indexPath.row) : movieManager.checkedOffMovieAtIndex(index: indexPath.row)
        cell.configMovieCell(movie: movieData)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        guard let librarySection = LibrarySection(rawValue: section) else { fatalError() }
        
        let sectionTitle = librarySection.rawValue == 0 ? "Movies To See" : "Movies Seen"
        return sectionTitle
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movieManager = movieManager else { fatalError() }
        guard let librarySection = LibrarySection(rawValue: indexPath.section) else {
            fatalError()
        }
        
        if librarySection == .moviesToSee {
            movieManager.checkOffMoviesAtIndex(index: indexPath.row)
            tableView.reloadData()
        }
    }
}
