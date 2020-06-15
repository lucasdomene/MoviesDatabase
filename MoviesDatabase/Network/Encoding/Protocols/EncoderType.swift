//
//  EncoderType.swift
//  MoviesDatabase
//
//  Created by lucas.firmo on 6/14/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

protocol EncoderType {
    func encode(_ urlRequest: URLRequest,
                parameters: Parameters) throws -> URLRequest
}
