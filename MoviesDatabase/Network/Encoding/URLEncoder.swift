//
//  URLEncoder.swift
//  MoviesDatabase
//
//  Created by lucas.firmo on 6/14/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

struct URLEncoder: EncoderType {
    
    func encode(_ urlRequest: URLRequest,
                parameters: Parameters) throws -> URLRequest {
        
        var urlRequest = urlRequest
        
        guard let url = urlRequest.url else {
            let error = NSError(domain: "", code: 10, userInfo: nil)
            throw error
        }
        
        if var urlComponents = URLComponents(url: url,
                                             resolvingAgainstBaseURL: false
        ) {
            urlComponents.queryItems = queryItems(parameters: parameters)
            urlRequest.url = urlComponents.url
        }
        
        return urlRequest
    }
    
    private func queryItems(parameters: Parameters) -> [URLQueryItem] {
        var queryItems = [URLQueryItem]()
        for (key, value) in parameters {
            let value = String(describing: value)
            
            let encodedValue = value.addingPercentEncoding(
                withAllowedCharacters: .urlFragmentAllowed
            )
            
            let queryItem = URLQueryItem(
                name: key,
                value: encodedValue
            )
            
            queryItems.append(queryItem)
        }
        return queryItems
    }
    
}
