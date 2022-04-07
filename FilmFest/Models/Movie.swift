//
//  Movie.swift
//  FilmFest
//
//  Created by Omar Regalado on 05/04/22.
//  Copyright © 2022 Author. All rights reserved.
//

import Foundation

struct Movie: Equatable {
    let title: String
    let releaseDate:  String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}

//Equibalence function
func==(lhs: Movie, rhs: Movie) -> Bool {
    if lhs.title != rhs.title {
        return false
    }
    
    if lhs.releaseDate != rhs.releaseDate {
        return false
    }
    
    return true
}
