//
//  ParameterEncoding.swift
//  MoviesDatabase
//
//  Created by lucas.firmo on 6/14/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

struct ParameterEncoder: ParameterEncoderType {
    
    private let bodyEncoder: EncoderType
    private let urlEncoder: EncoderType
    
    init(bodyEncoder: EncoderType,
         urlEncoder: EncoderType) {
        self.bodyEncoder = bodyEncoder
        self.urlEncoder = urlEncoder
    }
    
    func encode(urlRequest: URLRequest,
                bodyParameters: Parameters,
                urlParameters: Parameters) -> URLRequest? {
        
        var urlRequest = urlRequest
        var urlParameters = urlParameters
        
        addDefaultParameters(urlParameters: &urlParameters)
        
        if !bodyParameters.isEmpty {
            do {
                urlRequest = try bodyEncoder.encode(urlRequest,
                parameters: bodyParameters)
            } catch {
                return nil
            }
        }
        
        if !urlParameters.isEmpty {
            do {
                urlRequest = try urlEncoder.encode(urlRequest,
                                             parameters: urlParameters)
            } catch {
                return nil
            }
        }
        
        return urlRequest
    }
    
    private func addDefaultParameters(urlParameters: inout Parameters) {
        urlParameters["api_key"] = Environment.apiKey
    }
    
}
