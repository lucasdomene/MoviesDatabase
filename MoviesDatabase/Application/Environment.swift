//
//  Environment.swift
//  MoviesDatabase
//
//  Created by lucas.firmo on 6/14/20.
//  Copyright © 2020 domene. All rights reserved.
//

import Foundation

enum Environment {
    
    private static let infoDictionary: [String: Any] = {
        guard let infoDictionary = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return infoDictionary
    }()
    
    static let baseURL: URL = {
        guard let baseURLString = Environment.infoDictionary["BASE_URL"] as? String else {
            fatalError("Base URL not set in plist for this environment")
        }
        
        guard let baseURL = URL(string: baseURLString) else {
            fatalError("Base URL is invalid")
        }
        
        return baseURL
    }()
    
    static let apiKey: String = {
        guard let apiKey = Environment.infoDictionary["API_KEY"] as? String else {
            fatalError("API Key not set in plist for this environment")
        }
        return apiKey
    }()
    
}
