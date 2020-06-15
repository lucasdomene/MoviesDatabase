//
//  NetworkdManager.swift
//  MoviesDatabase
//
//  Created by lucas.firmo on 6/14/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

typealias NetworkResponse = (Result<Data, Error>) -> Void

final class NetworkManager {
    
    private let session: URLSessionType
    private let parameterEncoder: ParameterEncoderType
    private var task: URLSessionTask?
    
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
