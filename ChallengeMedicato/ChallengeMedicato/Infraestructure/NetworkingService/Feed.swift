//
//  Feed.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 24/8/21.
//

import Foundation

enum Feed {
    case popular
    case similar(id: Int)
}

extension Feed: Endpoint {
    
    var httpMethod: RequestMethod {
        switch self {
        case .popular, .similar:
            return .GET
        }
        
    }
    
    var path: String {
        switch self {
        case .similar(let id):
            return "tv/\(id)/similar"
        case .popular:
            return "/3/tv/popular"
        }
    }
}
