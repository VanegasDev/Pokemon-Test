//
//  Configuration.swift
//  Pokemon-Test
//
//  Created by Mario Vanegas on 14/1/26.
//

import Foundation
import Moya

enum Configuration {
    static let baseUrl = "https://pokeapi.co/api/v2/"
}

enum PokeNetworkMethod: String {
    case post = "POST"
    case put = "PUT"
    case get = "GET"
    case delete = "DELETE"
    case patch = "PATCH"
}

protocol PokeTargetType: TargetType {
    var apiURL: URL { get }
    var requestEndpoint: String { get }
    var requestHeaders: [String: String]? { get }
    var requestMethod: PokeNetworkMethod { get }
}

// MARK: Our Implementation
extension PokeTargetType {
    var apiURL: URL {
        guard let url = URL(string: Configuration.baseUrl) else {
            fatalError("Base URL Couldn't be Configured")
        }
        
        return url
    }
    
    var requestHeaders: [String: String]? {
        ["Content-Type": "application/json"]
    }
}

// MARK: Moya Implementation
extension PokeTargetType {
    var baseURL: URL {
        apiURL
    }
    
    var method: Moya.Method {
        switch requestMethod {
        case .delete: return .delete
        case .post: return .post
        case .get: return .get
        case .patch: return .patch
        case .put: return .put
        }
    }
    
    var headers: [String : String]? {
        requestHeaders
    }
    
    var path: String {
        requestEndpoint
    }
    
    var validationType: ValidationType {
        .successCodes
    }
    
    var sampleData: Data {
        Data()
    }
}
