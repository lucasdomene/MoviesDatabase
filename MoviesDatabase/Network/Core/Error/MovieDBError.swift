//
//  MovieDBError.swift
//  MoviesDatabase
//
//  Created by lucas.firmo on 6/14/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

enum MovieDBError: Error {
    case noConnection
    case fetching
    
    init(code: Int) {
        switch code {
        case NSURLErrorNotConnectedToInternet:
            self = .noConnection
        default:
            self = .fetching
        }
    }
}
