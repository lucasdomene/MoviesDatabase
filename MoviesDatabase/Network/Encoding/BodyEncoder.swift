//
//  BodyEncoder.swift
//  MoviesDatabase
//
//  Created by lucas.firmo on 6/14/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

struct BodyEncoder: EncoderType {
    
    func encode(_ urlRequest: URLRequest,
                parameters: Parameters) throws -> URLRequest {
        var urlRequest = urlRequest
        do {
            let data = try JSONSerialization.data(
                withJSONObject: parameters,
                options: .prettyPrinted
            )
            urlRequest.httpBody = data
        }
        
        return urlRequest
    }
    
}
