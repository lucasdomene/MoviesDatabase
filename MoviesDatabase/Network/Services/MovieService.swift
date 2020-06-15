//
//  MovieService.swift
//  MoviesDatabase
//
//  Created by lucas.firmo on 6/14/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

typealias MovieResult = (Result<[Movie], Error>) -> Void

struct MovieService {
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetch(page: Int, completion: @escaping MovieResult) {
        let route = MovieAPI.discover(page: page)
        networkManager.request(route: route) { result in
            switch result {
            case .success(let data):
                do {
                    let movieResponse = try JSONDecoder().decode(MovieResponse.self,
                                                          from: data)
                    
                    completion(.success(movieResponse.movies))
                } catch {
                    completion(.failure(MovieDBError.fetching))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
