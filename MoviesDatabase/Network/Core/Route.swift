//
//  Route.swift
//  MoviesDatabase
//
//  Created by lucas.firmo on 6/14/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

protocol Route {
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var bodyParameters: [String: Any] { get }
    var urlParameters: [String: Any] { get }
    
    func asURLRequest(parameterEncoder: ParameterEncoderType) -> URLRequest?
}

extension Route {
    var baseURL: String {
        return "https://api.themoviedb.org/3"
    }
    
    func asURLRequest(parameterEncoder: ParameterEncoderType) -> URLRequest? {
        var baseURL = URL(string: self.baseURL)
        baseURL?.appendPathComponent(path)
        
        guard let url = baseURL else { return nil }
        let urlRequest = URLRequest(url: url)

        return parameterEncoder.encode(
            urlRequest: urlRequest,
            bodyParameters: bodyParameters,
            urlParameters: urlParameters
        )
    }
    
}
