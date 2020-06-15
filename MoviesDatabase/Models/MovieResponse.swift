//
//  MovieResponse.swift
//  MoviesDatabase
//
//  Created by lucas.firmo on 6/14/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

struct MovieResponse {
    var movies: [Movie]
}

extension MovieResponse: Codable {
    
    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
    
}
