//
//  NetworkdManager.swift
//  MoviesDatabase
//
//  Created by lucas.firmo on 6/14/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

typealias HTTPHeader = [String: String]
typealias Parameters = [String: Any]
typealias NetworkResponse = (Result<Data, Error>) -> Void

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

protocol URLSessionType {
    func dataTask(with request: URLRequest,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionType {}

final class NetworkManager {
    
    let session: URLSessionType
    let parameterEncoder: ParameterEncoderType
    var task: URLSessionTask?
    
    init(session: URLSessionType,
         parameterEncoder: ParameterEncoderType) {
        self.session = session
        self.parameterEncoder = parameterEncoder
    }
    
    func request(route: Route, completion: @escaping NetworkResponse) {
        guard let urlRequest = route.asURLRequest(
            parameterEncoder: parameterEncoder
        ) else { return }
        
        task = session.dataTask(with: urlRequest) {
            data, _, error in
            if let error = error {
                let code = (error as NSError).code
                completion(.failure(MovieDBError(code: code)))
            }
            
            guard let data = data else {
                completion(.failure(MovieDBError.fetching))
                return
            }
            
            completion(.success(data))
        }
        
        task?.resume()
    }
    
    func cancel() {
        task?.cancel()
    }
}
