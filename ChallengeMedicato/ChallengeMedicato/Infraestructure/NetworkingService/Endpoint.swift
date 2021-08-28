//
//  Endpoint.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 24/8/21.
//

import Foundation

protocol Endpoint {
    
    var base: String { get }
    var path: String { get }
    var headers: [String: String] { get }
    var httpMethod: RequestMethod { get }
}

extension Endpoint {
    
    var headers: [String: String] {
        return [ "content-type": "application/json"]
    }
    
    var base : String {
        return AppEnvironment.baseURL
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        return components
    }
    
    func request(query items: [URLQueryItem]) -> URLRequest {
        var url = urlComponents
        url.queryItems = items
        var request = URLRequest(url: url.url!)
        print(request)
        request.allHTTPHeaderFields = headers
        return request
    }
    
}
