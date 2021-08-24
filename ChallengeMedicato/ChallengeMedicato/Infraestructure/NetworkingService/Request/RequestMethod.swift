//
//  RequestMethod.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 24/8/21.
//

import Foundation

enum RequestMethod: String {
    case POST = "POST"
    case DELETE = "DELETE"
    case GET = "GET"
    case PUT = "PUT"
    
    var value: String {
        return rawValue
    }
}
