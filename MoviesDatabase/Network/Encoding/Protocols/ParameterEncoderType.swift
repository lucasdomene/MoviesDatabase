//
//  ParameterEncoderType.swift
//  MoviesDatabase
//
//  Created by lucas.firmo on 6/14/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

protocol ParameterEncoderType {
    func encode(urlRequest: URLRequest,
                bodyParameters: Parameters,
                urlParameters: Parameters) -> URLRequest?
}
