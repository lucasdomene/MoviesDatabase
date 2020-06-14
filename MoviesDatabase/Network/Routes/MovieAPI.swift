//
//  MovieAPI.swift
//  MoviesDatabase
//
//  Created by lucas.firmo on 6/14/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

enum MovieAPI: Route {

    case discover(page: Int)
    
    var path: String {
        switch self {
        case .discover:
            return "/discover/movie"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .discover:
            return .get
        }
    }
    
    var bodyParameters: Parameters {
        switch self {
        case .discover:
            return [:]
        }
    }
    
    var urlParameters: Parameters {
        switch self {
        case let .discover(page):
            return ["page": page]
        }
    }

}
