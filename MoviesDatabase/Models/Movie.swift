//
//  Movie.swift
//  MoviesDatabase
//
//  Created by lucas.firmo on 6/14/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

struct Movie {
    
    var id: Int
    var title: String
    var year: String
    var poster: URL?
    var wallpaper: URL?
    var score: Double
    
}

extension Movie: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case year = "release_date"
        case poster = "poster_path"
        case wallpaper = "backdrop_path"
        case score = "vote_average"
    }
    
}
