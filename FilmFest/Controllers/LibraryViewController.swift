//
//  ViewController.swift
//  FilmFest
//
//  Created by Omar Regalado on 06/04/22.
//  Copyright © 2018 Author. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {

    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet var dataService: MovieLibraryDataService!
    
    var movieMonager = MovieManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.libraryTableView.dataSource = dataService
        self.libraryTableView.delegate = dataService
        
        dataService.movieManager = movieMonager
        
        //MARK:- MOCK DATA
        dataService.movieManager?.addMovie(movie: Movie(title: "Dr Strange", releaseDate: "2016"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Uncharted", releaseDate: "2022"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Spiderman No Way Home", releaseDate: "2021"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Dune", releaseDate: "2021"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Oz"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Gladiator"))
    }



}

